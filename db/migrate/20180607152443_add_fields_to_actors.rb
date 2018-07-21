class AddFieldsToActors < ActiveRecord::Migration[5.2]
  def change
    add_column :actors, :name, :string
    add_column :actors, :desc, :string
    add_column :actors, :actions, :string

    add_column :actors, :hp, :integer
    add_column :actors, :ac, :integer
    add_column :actors, :speed, :integer

    add_column :actors, :str, :integer
    add_column :actors, :dex, :integer
    add_column :actors, :con, :integer
    add_column :actors, :int, :integer
    add_column :actors, :wis, :integer
    add_column :actors, :cha, :integer

    add_column :actors, :saving_throws, :string
    add_column :actors, :skills, :string
    add_column :actors, :senses, :string
    add_column :actors, :languages, :string
    add_column :actors, :abilities, :string

    add_column :actors, :challenge, :integer

  end
end
