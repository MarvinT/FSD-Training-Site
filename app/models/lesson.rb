class Lesson < ActiveRecord::Base

  has_many :videos
  has_many :documents
  has_many :prezis

  validates_presence_of :title


  def self.title(id)
    Lesson.find(id).title
  end


end
