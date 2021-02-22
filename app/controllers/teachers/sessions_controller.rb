# frozen_string_literal: true

class Teachers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :not_logged_in, only: [:new, :create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def new_guest
    teacher = Teacher.guest
    sign_in teacher
    redirect_to teacher_path(teacher)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_in_path_for(resource)
    teacher_path(current_teacher)
  end
  
  def after_sign_out_path_for(resource)
    new_teacher_session_path
  end
end
