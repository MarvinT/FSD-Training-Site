class Comment < ActiveRecord::Base
  belongs_to :lesson
  
  validates_presence_of :title
  
  def self.sublesson(page,size)
    
  end
 
   
end