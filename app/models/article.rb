#NOTE: Active Record automatically defines model attributes for every table col, so don't have to declare them in model file


class Article < ApplicationRecord
    #if any validation fails, save will be aborted, appropriate error mesgs will be added to errors attribute of the model object


    #make sure there's a title (at least 1 non-whitespace char since it's a string)
    validates :title, presence: true

    #make sure there's a body with min length 10 chars
    validates :body, presence: true, length: { minimum: 10 }
end
