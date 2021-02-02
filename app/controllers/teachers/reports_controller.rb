class Teachers::ReportsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :correct_teacher, only: [ :edit, :update, :destroy ]
  
  def index
    @teacher = current_teacher
    @lessons = @teacher.lessons.all.order(id: :desc)
  end
  
  def show
    @report = Report.find(params[:id])
  end
  
  def new
    @report = Report.new
    @report.build_lesson
  end
  
  def create
    @report = Report.create(report_params)
    if @report.save
      flash[:notice] = '作成しました'
      redirect_to teachers_reports_path
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @report.update(report_params)
      flash[:notice] = "修正しました"
      redirect_to teachers_reports_path
    else
      flash.now[:error] = "修正できません"
      render :edit
    end
  end
  
  def destroy
    @report.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to teachers_reports_path
  end
  
  private
  
  def report_params
    params.require(:report).permit(
      :content, :exercise, :comprehension_lesson, :attitude, :done_homework, :comprehension_homework, :homework,
      lesson_attributes: [:teacher_id, :student_id, :lesson_date, :subject,:teaching_material, :unit]
    )
  end
  
  def correct_teacher
    @report = Report.find(params[:id])
    unless @report.lesson.teacher == current_teacher
      redirect_to teachers_reports_path
    end
  end
end
