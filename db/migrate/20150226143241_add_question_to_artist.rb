class AddQuestionToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :question, index: true
    add_foreign_key :artists, :questions
  end
end
