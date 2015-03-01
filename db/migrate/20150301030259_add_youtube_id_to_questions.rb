class AddYoutubeIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :youtube_id, :string
  end
end
