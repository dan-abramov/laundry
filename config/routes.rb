Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # scope '(:locale)', :locale => /ru|en|fr/ do
  # end

  root 'home#laundry'
  get 'about' => 'home#about'
  get 'location' => 'home#location'
  get 'individuals' => 'home#individuals'
  get 'organizations' => 'home#organizations'
  get 'cleaning' => 'home#dry_cleaning'
  get 'laundry' => 'home#laundry'
  #
  # resource :home, :controller => :home, only: [] do
  #   collection do
  #     get :about
  #     get :location
  #     get :individuals
  #     get :organizations
  #     get :dry_cleaning
  #     get :laundry
  #   end
  # end
  resources :pages, only: [:show]
  resources :posts, only: [:index, :show]
end
