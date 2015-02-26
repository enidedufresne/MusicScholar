class AddArtistToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :artist, index: true
    add_foreign_key :questions, :artists
  end
end
