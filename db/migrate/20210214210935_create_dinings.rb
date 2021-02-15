class CreateDinings < ActiveRecord::Migration[6.1]
  def change
    create_table :dinings do |t|
      t.string :name
      t.date :visit_date
      t.text :review
      t.integer :rating
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
