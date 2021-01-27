class Teachers::ReportsController < ApplicationController
  before_action :correct_teacher, only: [ :edit, :update, :destroy ]
  
  def index
    @teacher = current_teacher
    @reports = @teacher.reports.all
  end
  
  def show
    @report = Report.find(params[:id])
  end
  
  def new
    @report = current_teacher.reports.build
  end
  
  def create
    @report = current_teacher.reports.build(report_params)
    if @report.save
      flash[:success] = '作成しました'
      redirect_to teacher_reports_path(current_teacher)
    else
      flash.now[:danger] = '作成できませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @report.update(report_params)
      flash[:success] = "修正しました"
      redirect_to teacher_reports_path(current_teacher)
    else
      flash.now[:danger] = "修正できません"
      render :edit
    end
  end
  
  def destroy
    @report.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to teacher_reports_path
  end
  
  private
  
  def report_params
    params.require(:report).permit(
      :teacher_id, :student_id, :lesson_date, :subject,
      :teaching_material, :unit, :content, :exercise, :comprehension_lesson,
      :attitude, :done_homework, :comprehension_homework, :homework
    )
  end
  
  def correct_teacher
    @report = current_teacher.reports.find_by(id: params[:id])
    unless @report
      redirect_to teacher_reports_path(current_teacher)
    end
  end
end
