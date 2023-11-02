Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :expenses
  resources :savings
  resources :credit_cards
  resources :credits
  resources :categories, defaults: { format: :json }
  resources :users, param: :username do
    resources :credits, controller: 'credits'
    resources :credit_cards, controller: 'credit_cards'
    resources :savings, controller: 'savings'
    resources :expenses, controller: 'expenses'
  end
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
