class AddLeaderToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :leader, null: false, foreign_key: true
  end
end
