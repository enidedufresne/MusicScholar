class AddQuestionToOption < ActiveRecord::Migration
  def change
    add_reference :options, :question, index: true
    add_foreign_key :options, :questions
  end
end
