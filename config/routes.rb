Rails.application.routes.draw do
  resources :expenses
  resources :savings
  resources :credit_cards
  resources :credits
  resources :categories, defaults: { format: :json }
  resources :users, param: :_username do
    resources :user_credits, controller: 'credits'
    resources :credit_cards, controller: 'credit_cards'
    resources :savings, controller: 'savings'
    resources :expenses, controller: 'expenses'
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
