class ArticlesController < ApplicationController
  def index
    #controller instance vars can be accessed by the view, so @articles can be seen by app/views/articles/index.html.erb
    @articles = Article.all
  end


  def show
    #find specific article from id captured by route parameter
    #Returned art is stored in @article instance var, accessible by the view. By default, the show action will render app/views/articles/show.html.erb
    @article = Article.find(params[:id])
  end


  #'new' action instantiates new article, but doesn't save it. This article will be used in
  #view when building the form. By default, 'new' action will render app/views/articles/new.html.erb, 
  def new
    @article = Article.new
  end

  #'create' action instantiates new article w/values for title and body taken from params Hash, and attempts to save it. If article saved successfully, 
  #redirects browser to the article's page at "[sitename]/articles/#{@article.id}". Else, redisplays form by rendering app/views/articles/new.html.erb.
  def create
    @article = Article.new(article_params)

    if @article.save
      #redirect to article's page. redirect_to will cause browser to make new request 
      redirect_to @article
    else
      #render renders specified view for current request. **Important to use redirect_to after mutating database or application state.
      #Otherwise, if user refreshes the page, browser will make same request, and mutation will be repeated
      render :new
    end
  end

  #specify what values are allowed in the params hash (strong typing for params). Otherwise malicious user could potentially submit extra form 
  #fields and overwrite private data.
  private
    def article_params
      #filter params
      params.require(:article).permit(:title, :body)
    end

end
