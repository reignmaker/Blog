class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :blog

  validates_presence_of :title
end
