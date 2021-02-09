class StudentsController < ApplicationController
  before_action :authenticate_teacher!, only: [:index]
  before_action :authenticate_student!, only: [:show]
  before_action :correct_student, only: [:show]
  
  def index
    @students = Student.all
  end
  
  def show
  end
    
  
  private
  
  def correct_student
    @student = Student.find(params[:id])
    unless @student == current_student
      redirect_to student_path(current_student)
    end
  end
  
  
end
