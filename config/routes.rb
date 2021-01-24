Rails.application.routes.draw do
  root to: 'top#top'
  
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    passwords: 'students/passwords',
    registrations: 'students/registrations'
  }
  
  resources :students, :only => [:show]
  
  #あとでteachers/#{teachers.id}/profile_editに変更したい
  
  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    passwords: 'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  
  devise_scope :teacher do
    get 'teachers/profile_edit', to: 'teachers/registrations#profile_edit', as: :profile_edit
    patch 'teachers/profile_update', to: 'teachers/registrations#profile_update', as: :profile_update
  end

  resources :teachers, :only => [:index, :show]
end
