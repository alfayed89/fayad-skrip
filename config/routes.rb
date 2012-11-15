Fayad::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :users

  resources :divisis

  resources :jabatans

  resources :holydays

  resources :absens

  resources :gajis

  resources :banks

  resources :pengalamen

  resources :kota

  resources :provinsis

  resources :pendidikans

  resources :karyawans

  root :to => "home#index"
end
