class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :filename
      t.date :date
      t.float :distance
      t.float :elev_change
      t.integer :duration

      t.timestamps
    end
  end
end
