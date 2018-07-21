class AddFavoritesToUsersAndTemplates < ActiveRecord::Migration[5.2]
  def change

    create_join_table :templates, :users do |t|
      t.index :template_id 
      t.index :user_id
    end

  end
end
