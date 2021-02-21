class TopController < ApplicationController
  before_action :not_logged_in , only: [:top]
  def top
  end
end
