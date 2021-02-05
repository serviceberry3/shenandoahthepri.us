Rails.application.routes.draw do
  get 'dining/index'
  get 'shopping/index'
  get 'pitstops/index'
  get 'parks/index'
  get 'cities/index'
  #add route that maps root path of our app to appropriate controller and action
  #root route is mapped to index action of articles controller
  root "articles#index"


  #resources method maps all conventional routes for a collection of resources, such as articles ("resourceful routing")
  #automatically creates routes for destroy, create, edit, etc. eg. maps DELETE /articles/:id requests to the destroy action of ArticlesController
  resources :articles do
    #creates comments as nested resrc within articles. This is another pt of capturing hierarchical relationship between articles and comments
    resources :comments
  end

  get "/car", to: "pages#car"

  #This will send every url that matches /pages/ to our pages controller we created above, passing :page as parameter
  get "/pages/:page" => "pages#show"




=begin comment
  get "/articles", to: "articles#index"

  #the :id part designates a route parameter, which captures a segment of the route's path and puts that val
  #into the ```params``` Hash which is accessible by the controller action
  #ex. GET http://localhost:3000/articles/1 1 is the id, which would then be accessible as params[:id] in the ```show``` action of ArticlesController
  get "/articles/:id", to: "articles#show"
=end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
