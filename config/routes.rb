Rails.application.routes.draw do
  root to: 'works#home'
  resources :works
end
