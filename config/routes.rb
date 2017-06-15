Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :pins
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'mypins' => 'pins#mypins'
  get 'pinsoff/:user_id' => 'pins#pinsoff', :as => "pinsoff"

  #Salir
  devise_scope :user do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
