class AddCountToAnals < ActiveRecord::Migration[7.0]
  def change
    add_column :anals, :count, :integer, default: 1
  end
end
