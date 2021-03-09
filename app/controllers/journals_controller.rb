class JournalsController < ApplicationController
    def index
        @journals = Journal.all
      end
    
    
      def show
        @journal = Journal.find(params[:id])
        @journal_json = @journal.to_json
      end
    
    
      #'new' action instantiates new article, but doesn't save it (this is when URL/articles/new is visited, and GET /articles/new rqst). 
      #This article will be used in view when building the form. By default, 'new' action will render app/views/articles/new.html.erb, 
      def new
        @journal = Journal.new
      end

      def create
        logger.debug "Track dbug: #{journal_params[:track_id].to_s}"

        #get ID of specified Track to link. This line unnecessary, just for query practice
        journal_params[:track_id] = Track.where(["id = ?", journal_params[:track_id]]).first.id;
 
        if (journal_params[:floating] == "1")
            journal_params[:floating] = 1
        else
            journal_params[:floating] = 0
        end

        @journal = Journal.new(journal_params)
    
        if @journal.save
          #redirect to article's page. redirect_to will cause browser to make new request 
          redirect_to @journal
        #otherwise if some validations fails, etc. : just re-render the new page
        else
          #render renders specified view for current request. **Important to use redirect_to after mutating database or application state.
          #Otherwise, if user refreshes the page, browser will make same request, and mutation will be repeated
          render :new
        end
      end



      #specify what values are allowed in the params hash (strong typing for params). Otherwise malicious user could potentially submit extra form 
    #fields and overwrite private data.
    private
    def journal_params
        #filter params
        params.require(:journal).permit(:title, :body, :lat, :long, :date, :floating, :track_id)
    end
end
