class AddActorsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :user_id, :integer
  end
end
