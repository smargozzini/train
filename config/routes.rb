Rails.application.routes.draw do
  post 'train-line', to: 'train_line#create'
  get 'route', to: 'route#shortest_route'
end
