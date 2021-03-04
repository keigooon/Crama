class Students::QuestionsController < ApplicationController
  before_action :authenticate_student!, only: [:index, :create, :destroy]
  before_action :correct_student, only: [:create, :destroy]
  
  def index
    @questions = current_student.questions.all.order(id: :desc).page(params[:page]).per(5)
    @question = current_student.questions.new
  end
  
  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.all.order(id: :desc).page(params[:page]).per(5)
  end
  
  
  def create
    current_student.questions.create(question_params)
    @questions = current_student.questions.all.order(id: :desc).page(params[:page]).per(5)
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    @questions = current_student.questions.all.order(id: :desc).page(params[:page]).per(5)
  end
  
  private
  
  def question_params
    params.require(:question).permit(:content)
  end
  
  def correct_student
    @student = Student.find(params[:student_id])
    unless @student.id == current_student.id
      redirect_to student_path(current_student)
    end
  end
  
end
