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


  #'new' action instantiates new article, but doesn't save it (this is when URL/articles/new is visited, and GET /articles/new rqst). 
  #This article will be used in view when building the form. By default, 'new' action will render app/views/articles/new.html.erb, 
  def new
    @article = Article.new
  end

  #this happens when new article form is submitted, and POST /articles rqst. Validations are checked
  #'create' action instantiates new article w/values for title and body taken from params Hash, and attempts to save it. If article saved successfully, 
  #redirects browser to the article's page at "[sitename]/articles/#{@article.id}". Else, redisplays form by rendering app/views/articles/new.html.erb.
  def create
    @article = Article.new(article_params)

    if @article.save
      #redirect to article's page. redirect_to will cause browser to make new request 
      redirect_to @article
    #otherwise if some validations fails, etc. : just re-render the new page
    else
      #render renders specified view for current request. **Important to use redirect_to after mutating database or application state.
      #Otherwise, if user refreshes the page, browser will make same request, and mutation will be repeated
      render :new
    end
  end

  #pull up an article for editing
  #fetches the article from the database, stores it in @article so can be used when building the form  
  def edit
    @article = Article.find(params[:id])
  end

  #(re-)fetches article from the db, attempts to update it w/submitted form data filtered by article_params
  def update
    @article = Article.find(params[:id])

    #try to save edited article, if it goes thru, display new article
    if @article.update(article_params)
      redirect_to @article

    #if something fails, re-render the edit page (with error mesgs this time)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path #index in this case. could also redirect to articles_path, etc.
  end

  #specify what values are allowed in the params hash (strong typing for params). Otherwise malicious user could potentially submit extra form 
  #fields and overwrite private data.
  private
    def article_params
      #filter params
      params.require(:article).permit(:title, :body)
    end

end
