class AddCategoryToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :category, index: true
    add_foreign_key :artists, :categories
  end
end
