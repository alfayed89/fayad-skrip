Fayad::Application.routes.draw do

  get "dashboard/index"
  put "dashboard/absen" => "dashboard#absen"
  get "dashboard/vacation" => "dashboard#vacation"
  get "dashboard/education" => "dashboard#pendidikan"
  get "dashboard/experience" => "dashboard#pengalaman"
  get "dashboard/salary(/:state/:id)" => "dashboard#salary"
  post "dashboard/vacation" => "dashboard#create_vacation"
  post "dashboard/education" => "dashboard#create_pendidikan"
  post "dashboard/experience" => "dashboard#create_pengalaman"

  devise_for :karyawans, :path => :user
  resources :karyawans do
    collection do
      get "search" , :action => :search_ajax
    end
  end
  resources :absens,    :except => [:create, :new]
  resources :holydays,  :except => [:create, :new] do 
    member do
      put "approve" , :action => :approve, :format => :json
    end
  end
  resources :jabatans
  resources :pendidikans
  resources :pengalamen
  resources :gajis
  resources :divisis
  resources :cities
  resources :provinces
  root :to => 'dashboard#index'
end
