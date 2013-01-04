Fayad::Application.routes.draw do

  get "dashboard/index"

  devise_for :karyawans, :path => :user
  resources :karyawans
  resources :absens, :except => [:create, :new]
  resources :holydays,  :except => [:create, :new]
  resources :jabatans
  resources :pendidikans ,  :except => [:create, :new]
  resources :pengalamen, :except => [:create, :new]
  resources :gajis
  resources :divisis
  resources :cities
  resources :provinces
  root :to => 'dashboard#index'
end
