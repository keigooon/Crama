Rails.application.routes.draw do
  root to: 'top#top'
  
  #生徒関連
  
  devise_for :students, skip: ["passwords"], controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }
  
  devise_scope :student do
    get 'students/profile_edit', to: 'students/registrations#profile_edit', as: :students_profile_edit
    patch 'students/profile_update', to: 'students/registrations#profile_update', as: :students_profile_update
    post 'students/guest_sign_in', to: 'students/sessions#new_guest'
  end
  
  resources :students, :only => [:index, :show] do
    resources :reports, :only => [:index, :show], controller: "students/reports"
    resources :lesson_logs, :only => [:index, :edit, :update], controller: "students/lesson_logs"
    resources :questions, :only => [:index, :show, :create, :destroy], controller: "students/questions"
  end
  
  
  #講師関連
  #あとでteachers/#{teachers.id}/profile_editにしたいかも
  
  devise_for :teachers, skip: ["passwords"], controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  
  devise_scope :teacher do
    get 'teachers/profile_edit', to: 'teachers/registrations#profile_edit', as: :teachers_profile_edit
    patch 'teachers/profile_update', to: 'teachers/registrations#profile_update', as: :teachers_profile_update
    post 'teachers/guest_sign_in', to: 'teachers/sessions#new_guest'

  end

  resources :teachers, :only => [:show] do
    resources :reports, controller: "teachers/reports"
  end

  resources :questions, :only => [:index]
  
  resources :comments, :only => [:create, :destroy]
  
end
