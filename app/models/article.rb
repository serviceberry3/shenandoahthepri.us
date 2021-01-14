#NOTE: Active Record automatically defines model attributes for every table col, so don't have to declare them in model file
# @title is an instance var, available to all methods within the class (and available to the view and all partials rendered in the view), 
#belongs to that one instance of the class
# title is a local var, exists only within its scope (current block/method)

class Article < ApplicationRecord
    #when you have has_many on one model linking to belongs_to on the other model, some nice behaviors come stock
    #e.g. if you have instance var @article containing an article, you can retrieve all comments belonging to that art as array using @article.comments
    has_many :comments


    #if any validation fails, save will be aborted, appropriate error mesgs will be added to errors attribute of the model object


    #make sure there's a title (at least 1 non-whitespace char since it's a string)
    validates :title, presence: true

    #make sure there's a body with min length 10 chars
    validates :body, presence: true, length: { minimum: 10 }
end
