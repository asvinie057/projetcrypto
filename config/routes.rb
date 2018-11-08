Rails.application.routes.draw do
  get 'cryptos/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crypto', to: 'cryptos#index'
end
