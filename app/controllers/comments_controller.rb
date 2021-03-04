class CommentsController < ApplicationController
  before_action :authenticate_teacher!, if: proc{ teacher_signed_in? }
  before_action :correct_user, only: [:destroy]
  
  
  def create
    if teacher_signed_in?
      @comment = current_teacher.comments.new(comment_params)
      @comment.is_teacher = true
    elsif student_signed_in?
      @comment = current_student.comments.new(comment_params)
      @comment.is_teacher = false
    end
    @comment.save
    @comments = Comment.where(question_id: @comment.question_id).order(id: :desc).page(params[:page]).per(5)
  end
  
  def destroy
    qid = @comment.question_id
    @comment.destroy
    @comments = Comment.where(question_id: qid).order(id: :desc).page(params[:page]).per(5)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :question_id)
  end
  
  
  
  def correct_user
    @comment = Comment.find(params[:id])
    if teacher_signed_in?
      unless @comment.teacher == current_teacher
        redirect_to student_question_path(@comment.question.student, @comment.question)
      end
    elsif student_signed_in?
      unless @comment.student == current_student
        redirect_to student_path(current_student)
      end
    end
  end
end
