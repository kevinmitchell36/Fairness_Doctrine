class AddUserIdToPublication < ActiveRecord::Migration[5.1]
  def change
    add_column :publications, :user_id, :integer
  end
end
