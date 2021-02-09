class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: [:show]
  
  def show
  end
end
