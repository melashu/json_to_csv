class RenamePossitionToPosition < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :possition, :position
  end
end
