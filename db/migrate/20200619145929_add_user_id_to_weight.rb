class AddUserIdToWeight < ActiveRecord::Migration[6.0]
  def change
    add_column :weights, :user_id, :integer
  end
end
