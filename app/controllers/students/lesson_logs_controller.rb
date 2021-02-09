class Students::LessonLogsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_params, only: [:edit, :update]
  
  def index
    @student = Student.find(params[:student_id])
    @lessons = @student.lessons.all.order(id: :desc)
  end

  def edit
  end
  
  def update
    if @lesson_log.update(lesson_log_params)
      flash[:notice] = "修正しました"
      redirect_to student_lesson_logs_path(@lesson_log.lesson.student)
    else
      flash.now[:error] = "修正できません"
      render :edit
    end
  end
  
  private
  
  def set_params
    @lesson_log = LessonLog.find(params[:id])
  end
  
  def lesson_log_params
    params.require(:lesson_log).permit(:remarks)
  end
  
  def correct_teacher
    @lesson_log = LessonLog.find(params[:id])
    unless @lesson_log.lesson.teacher == current_teacher
      redirect_to student_lesson_logs_path(@lesson_log.lesson.student)
    end
  end
end
