Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq" # mounting sidekiq to a route so that I can see my active jobs.
   resources :users, only: %i[index]
end
