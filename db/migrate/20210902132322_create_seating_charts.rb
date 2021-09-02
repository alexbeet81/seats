class CreateSeatingCharts < ActiveRecord::Migration[6.1]
  def change
    create_table :seating_charts do |t|
      t.integer :number_of_students
      t.integer :rows
      t.integer :columns
      t.references :class_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
