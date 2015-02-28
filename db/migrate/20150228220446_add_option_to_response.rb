class AddOptionToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :option, index: true
    add_foreign_key :responses, :options
  end
end
