class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: [:index]
  
  def index
    @teachers = Teacher.all
  end
end
