class Component < ActiveRecord::Base
  belongs_to :lesson

  class Video < Component
  end

  class Document < Component
  end

  class Prezi < Component
  end

end
