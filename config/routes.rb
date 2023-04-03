Rails.application.routes.draw do
  post 'train-line', to: 'train_line#create'
  post 'card', to: 'card#create'
  get 'route', to: 'route#shortest_route'
end
