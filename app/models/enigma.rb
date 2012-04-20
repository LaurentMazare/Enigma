class Enigma < ActiveRecord::Base
  attr_accessible :content, :long_solution, :name, :short_solution, :title, :tags
  has_and_belongs_to_many :tags

  def tags_string
    tags.map{|tag| tag.name}.join(", ")
  end

  def date_string
    created_at.strftime("%d %B %Y")
  end
end
