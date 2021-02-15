class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.string :title
      t.text :body
      t.float :lat
      t.float :long
      t.date :date
      t.boolean :floating
      t.references :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
