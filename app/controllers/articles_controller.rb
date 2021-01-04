class ArticlesController < ApplicationController
  def index
    #controller instance vars can be accessed by the view, so @articles can be seen by app/views/articles/index.html.erb
    @articles = Article.all
  end
end
