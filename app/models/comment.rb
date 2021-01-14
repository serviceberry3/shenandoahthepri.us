class Comment < ApplicationRecord
  #include some status logic from a concerns module
  include Visible

  #sets up an Active Record association. :references used in generate model is special data type for models,
  #creates new column on db table w/provided model name appended with an _id that can hold integer values
  belongs_to :article
end
