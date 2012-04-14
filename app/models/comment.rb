class Comment < ActiveRecord::Base
  belongs_to :lesson
  
  validates_presence_of :title
end