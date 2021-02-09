class Students::ReportsController < ApplicationController
  
  def index
    @lessons =  current_student.lessons.all.order(id: :desc)
  end
  
  def show
    @report = Report.find(params[:id])
  end
end
