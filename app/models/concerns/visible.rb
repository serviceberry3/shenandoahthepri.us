module Visible
    extend ActiveSupport::Concern


    included do
        VALID_STATUSES = ['public', 'private', 'archived']

        #make sure status is one of the three possible ones
        validates :status, in: VALID_STATUSES
    end

    #method to get count of public articles, comments, etc
    class_methods do
        def public_count
          where(status: 'public').count
        end
      end


    def archived?
      status == 'archived'
    end
  end
  