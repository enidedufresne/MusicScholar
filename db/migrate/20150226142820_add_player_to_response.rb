class AddPlayerToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :player, index: true
    add_foreign_key :responses, :players
  end
end
