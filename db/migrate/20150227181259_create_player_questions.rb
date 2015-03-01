class CreatePlayerQuestions < ActiveRecord::Migration
  def change
    create_table :player_questions do |t|
      t.belongs_to :player, index: true
      t.belongs_to :question, index: true
      t.boolean :correct

      t.timestamps null: false
    end
    add_foreign_key :player_questions, :players
    add_foreign_key :player_questions, :questions
  end
end
