Rails.application.routes.draw do
  #This 
  root 'home#index'  
    scope '/api' do
      # post "students/signup", to: "students/registerations#create"
      # post "students/login", to: "students/sessions#create"
      # delete "students/logout", to: "students/sessions#destroy"
      # post "admins/signup", to: "admins/registerations#create"
      # post "admins/login", to: "admins/sessions#create"
      # delete "admins/logout", to: "admins/sessions#destroy"   
      # post "teachers/signup", to: "teachers/registerations#create"
      # post "teachers/login", to: "teachers/sessions#create"
      # delete "teachers/logout", to: "teachers/sessions#destroy"
      # put "admins/students/:id", to: "admins/students#update"
      # put "admins/courses/:id", to: "courses#update"
      devise_for :students,:path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, controllers: { registrations: 'students/registrations' , sessions: 'students/sessions'}
      devise_for :admins,:path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, controllers: { registrations: 'admins/registrations' , sessions: 'admins/sessions'}
      devise_for :teachers,:path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, controllers: { registrations: 'teachers/registrations' , sessions: 'teachers/sessions'}


      # devise_for :students, :path => 'students', 

      resources :courses, controller: 'courses/resources', only: [:index, :show, :create]
      resources :grades , controller: 'grades/resources', only: [:index, :show, :create]
    end
    resources :students , controller: 'students', only: [:index]
    get '/list' , to: "errors#list"
    match "*path", to: "errors#not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
