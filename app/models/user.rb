class User < ApplicationRecord
  #validates :name, :presence => true, :length => {:in 1..30}
  has_secure_password
  has_many :actors
  has_and_belongs_to_many :templates, uniq: true


end
