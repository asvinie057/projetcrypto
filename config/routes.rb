Rails.application.routes.draw do

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/crypto', to: 'cryptos#index'
  get '', to: 'home#index'
end
