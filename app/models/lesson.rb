class Lesson < ActiveRecord::Base

  has_many :components
  validates_presence_of :title

  def videos
    components.where(:type => 'Video')
  end

  def prezis
    components.where(:type => 'Prezi')
  end

  def documents
    components.where(:type => 'Document')
  end

end
