class CreatePitstops < ActiveRecord::Migration[6.1]
  def change
    create_table :pitstops do |t|
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
