class Lesson < ActiveRecord::Base

  has_many :videos
  has_many :documents
  has_many :prezis
  has_many :comments

  validates_presence_of :title


  def self.title(id)
    Lesson.find(id).title
  end


end
