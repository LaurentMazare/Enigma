class Enigma < ActiveRecord::Base
  attr_accessible :content, :long_solution, :name, :short_solution, :title, :tags, :user
  has_and_belongs_to_many :tags
  belongs_to :user

  def date_string
    created_at.strftime("%d %B %Y")
  end
end
