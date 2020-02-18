# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'new', to: 'games_controller#new', as: :new
  get 'score', to: 'games_controller#score', as: :score
end
