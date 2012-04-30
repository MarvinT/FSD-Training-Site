class Lesson < ActiveRecord::Base

  has_many :videos
  has_many :documents
  has_many :prezis
  has_many :comments

  validates_presence_of :title

  before_save { |lesson| lesson.position = Lesson.next_position()}

  def self.title(id)
    Lesson.find(id).title
  end

  def self.next_position()
    if Lesson.all.empty?
      return 0
    else
      return Lesson.order(:position).last.position + 1
    end
  end
  
  def self.sublessons(page,size)
    
  end

end
