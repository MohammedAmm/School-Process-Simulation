Rails.application.routes.draw do
  #This 
  root 'home#index'  
    scope '/api' do
      # devise_for :admins, controllers: {sessions: 'admins/sessions',registrations: 'admins/sessions'},
      # path: 'admins', path_names: {sign_in: 'login', sign_out: 'logout', sign_up:'register'}    
      devise_for :admins, path_names: {
        sign_in: 'login', sign_out: 'logout',
        registration: 'register'
      },controllers: { registrations: 'admins/registrations' , sessions: 'admins/sessions'}

      devise_for :teachers, path_names: {
        sign_in: 'login', sign_out: 'logout',
        registration: 'register'
      },controllers: { registrations: 'teachers/registrations' , sessions: 'teachers/sessions'}
      
      devise_for :students, path_names: {
        sign_in: 'login', sign_out: 'logout',
        registration: 'register'
      },controllers: { registrations: 'students/registrations' , sessions: 'students/sessions'}

      # devise_for :students, :path => 'students', 
      resources :courses, controller: 'courses/resources', only: [:index, :show, :create]
      resources :grades , controller: 'grades/resources', only: [:index, :show, :create]     
      put "admins/students/:id", to: "admins/students#update"
      put "admins/courses/:id", to: "courses#update"
    end
    resources :students , controller: 'students', only: [:index]
    get '/list' , to: "errors#list"
    match "*path", to: "errors#not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
