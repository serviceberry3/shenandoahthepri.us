class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    #specify how articles sql table should be constructed 
    create_table :articles do |t| #create_table adds id by default
      #define two columns for the table called title and body
      t.string :title
      t.text :body

      #define two additional cols named created_at and updated_at, updated by Rails when we create or update a model obj
      t.timestamps
    end
  end
end
