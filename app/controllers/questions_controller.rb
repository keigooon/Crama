class QuestionsController < ApplicationController
  before_action :authenticate_teacher!, only: [:index]
  def index
    @questions = Question.all.order(id: :desc).page(params[:page]).per(5)
  end
end
