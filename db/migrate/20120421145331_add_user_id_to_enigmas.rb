class AddUserIdToEnigmas < ActiveRecord::Migration
  def change
    add_column :enigmas, :user_id, :integer
  end
end
