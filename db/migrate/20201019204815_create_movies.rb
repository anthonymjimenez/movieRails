class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :favorites
      t.string :title
      t.text :overview
      t.string :release_date

      t.timestamps
    end
  end
end
