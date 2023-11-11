class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :description
      t.string :group_type
      t.string :name
      t.string :size
      t.references :leader, null: true, foreign_key: true

      t.timestamps
    end
  end
end
