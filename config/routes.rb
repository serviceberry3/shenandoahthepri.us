Rails.application.routes.draw do
  #add route that maps root path of our app to appropriate controller and action
  #root route is mapped to index action of articles controller
  root "articles#index"


  get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
