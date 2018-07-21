class Template < ApplicationRecord

  # DATA ELEMENTS
  #add_column :templates, :name, :string
  #add_column :templates, :desc, :string
  #add_column :templates, :actions, :string

  #add_column :templates, :hp_s, :string
  #add_column :templates, :ac_s, :string
  #add_column :templates, :speed, :string

  #add_column :templates, :str_s, :string
  #add_column :templates, :dex_s, :string
  #add_column :templates, :con_s, :string
  #add_column :templates, :int_s, :string
  #add_column :templates, :wis_s, :string
  #add_column :templates, :cha_s, :string

  #add_column :templates, :saving_throws, :string
  #add_column :templates, :skills, :string
  #add_column :templates, :senses, :string
  #add_column :templates, :languages, :string
  #add_column :templates, :abilities, :string

  #add_column :templates, :challenge, :integer
  has_and_belongs_to_many :users
  has_attached_file :image, styles:{small: "64x64!", med:"256x256!", large: "512x512!"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
