# frozen_string_literal: true

class Teachers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update, :profile_update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  def profile_edit
 
  end
 
  def profile_update
    current_teacher.assign_attributes(account_update_params)
    if current_teacher.save
      flash[:success] = "講師情報を編集しました"
	    redirect_to teacher_path(current_teacher)
    else
      flash.now[:danger] = "講師情報を編集できませんでした"
      render :profile_edit
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :course])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :course])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
     teacher_path(current_teacher)
  end

  # The path used after sign up for inactive accounts.
  #def after_inactive_sign_up_path_for(resource)
    
  #end
end
