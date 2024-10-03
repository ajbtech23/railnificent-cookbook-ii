class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :category, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
