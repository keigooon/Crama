class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: [:index, :show]
  
  def index
    @teachers = Teacher.all
  end
  def show
    @teacher = Teacher.find(params[:id])
  end
end
