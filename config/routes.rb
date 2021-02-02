Rails.application.routes.draw do
  root to: 'top#top'
  
  #生徒関連
  
  devise_for :students, skip: ["passwords","registrations"], controllers: {
    sessions: 'students/sessions'
  }
  
  devise_scope :student do
    get 'students/sign_up', to: 'students/registrations#new', as: :new_student_registration
    #get 'students/profile_edit', to: 'students/registrations#profile_edit', as: :profile_edit
    #patch 'students/profile_update', to: 'students/registrations#profile_update', as: :profile_update
  end
  
  resources :students, :only => [:show]
  resources :students do
    resources :reports, :only => [:index, :show] , controller: "students/reports"
  end
  
  
  #講師関連
  #あとでteachers/#{teachers.id}/profile_editにしたいかも
  
  devise_for :teachers, skip: ["passwords"], controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  
  devise_scope :teacher do
    get 'teachers/profile_edit', to: 'teachers/registrations#profile_edit', as: :profile_edit
    patch 'teachers/profile_update', to: 'teachers/registrations#profile_update', as: :profile_update
  end

  resources :teachers, :only => [:index] 
  
  namespace :teachers do
    resources :reports, controller: :reports
  end
  
end
