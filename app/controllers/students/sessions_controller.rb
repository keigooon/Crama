# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
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
    student = Student.guest
    sign_in student
    redirect_to student_path(student)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
  
  def after_sign_in_path_for(resource)
    student_path(current_student)
  end
  
  def after_sign_out_path_for(resource)
    new_student_session_path
  end
end
