Rails.application.routes.draw do
  # get 'travel/index'
  root to: 'travel#index' # the default route
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search' => 'travel#search'
end
