class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :company
      t.string :possition
      t.decimal :salary

      t.timestamps
    end
  end
end
