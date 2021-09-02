class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :chinese_name
      t.string :english_name
      t.integer :number
      t.integer :participation_score
      t.references :class_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
