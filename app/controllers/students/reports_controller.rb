class Students::ReportsController < ApplicationController
  before_action :authenticate_student!, only: [:index, :show]
  def index
    @lessons =  current_student.lessons.all.order(id: :desc)
  end
  
  def show
    @report = Report.find(params[:id])
  end
end
