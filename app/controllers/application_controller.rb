class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
 def not_logged_in
   if teacher_signed_in?
     redirect_to teacher_path(current_teacher)
   elsif student_signed_in?
     redirect_to student_path(current_student)
   end
 end
end
