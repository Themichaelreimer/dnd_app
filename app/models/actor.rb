class Actor < ApplicationRecord

  # DATA ELEMENTS
  #add_column :actors, :name, :string
  #add_column :actors, :desc, :string
  #add_column :actors, :actions, :string
  #add_column :actors, :hp, :integer
  #add_column :actors, :cur_hp, :integer
  #add_column :actors, :ac, :integer
  #add_column :actors, :speed, :integer
  #add_column :actors, :str, :integer
  #add_column :actors, :dex, :integer
  #add_column :actors, :con, :integer
  #add_column :actors, :int, :integer
  #add_column :actors, :wis, :integer
  #add_column :actors, :cha, :integer
  #add_column :actors, :saving_throws, :string
  #add_column :actors, :skills, :string
  #add_column :actors, :senses, :string
  #add_column :actors, :languages, :string
  #add_column :actors, :abilities, :string
  #add_column :actors, :challenge, :integer

  belongs_to :user
  has_attached_file :image, styles:{small: "64x64!", med:"256x256!", large: "512x512!"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attr_accessor :dmg
end
