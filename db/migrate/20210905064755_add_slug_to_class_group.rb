class AddSlugToClassGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :class_groups, :slug, :string
  end
end
