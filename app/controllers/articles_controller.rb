class ArticlesController < ApplicationController
  def index
    #controller instance vars can be accessed by the view, so @articles can be seen by app/views/articles/index.html.erb
    @articles = Article.all
  end


  def show
    #find specific article from id captured by route parameter
    #Returned art is stored in @article instance var, accessible by the view By default, the show action will render app/views/articles/show.html.erb
    @article = Article.find(params[:id])
  end


end
