class Lesson < ActiveRecord::Base

  has_many :components
  validates_presence_of :title
end
