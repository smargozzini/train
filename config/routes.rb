Rails.application.routes.draw do
  post 'train-line', to: 'train_line#create'
  post 'card', to: 'card#create'
  post 'station/:name/enter', to: 'station#enter'
  post 'station/:name/exit', to: 'station#exit'
  get 'route', to: 'route#shortest_route'
end
