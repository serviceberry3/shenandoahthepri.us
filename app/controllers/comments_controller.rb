class CommentsController < ApplicationController
    def create
        #each request for a comment has to keep track of article to which comment is attached
        @article = Article.find(params[:article_id])

        #use the create method on @article.comments to create and save comment, will automatically link comment so it belongs to that particular article
        @comment = @article.comments.create(comment_params)

        #Once we have made new comment, send the user back to original article, which calls show action of ArticlesController
        redirect_to article_path(@article)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
