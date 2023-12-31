Rails.application.routes.draw do
  get 'users/index'
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'divisible_numbers/find_divisible_numbers', to: 'divisible_numbers#find_divisible_numbers'
  resources :users, only: [:index]
end
