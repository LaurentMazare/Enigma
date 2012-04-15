class Tag < ActiveRecord::Base
  attr_accessible :category, :description, :name
  has_and_belongs_to_many :enigmas
end
