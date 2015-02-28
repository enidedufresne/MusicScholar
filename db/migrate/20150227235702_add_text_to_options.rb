class AddTextToOptions < ActiveRecord::Migration
  def change
    add_column :options, :text, :string
    add_column :options, :correct, :boolean
  end
end
