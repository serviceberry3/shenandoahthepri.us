#NOTE: Active Record automatically defines model attributes for every table col, so don't have to declare them in model file
# @title is an instance var, available to all methods within the class (and available to the view), belongs to that one instance of the class
# title is a local var, exists only within its scope (current block/method)

class Article < ApplicationRecord
    #if any validation fails, save will be aborted, appropriate error mesgs will be added to errors attribute of the model object


    #make sure there's a title (at least 1 non-whitespace char since it's a string)
    validates :title, presence: true

    #make sure there's a body with min length 10 chars
    validates :body, presence: true, length: { minimum: 10 }
end
