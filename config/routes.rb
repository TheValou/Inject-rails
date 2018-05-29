Rails.application.routes.draw do
  resources :computers_brands
  resources :computers_quests_resps
  resources :computers_quests
  resources :computers_prices
  resources :computers_os
  resources :computers_keyboards
  resources :computers_gpus
  resources :computers_cpus
  resources :users_roles
  resources :users_auths
  resources :users
  resources :computers_traders
  resources :computers_screens
  resources :computers_activities
  resources :computers
  resources :sequelize_meta
  resources :computers_chipsets
  resources :sequelizemeta
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
