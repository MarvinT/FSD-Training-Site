class Component < ActiveRecord::Base
  belongs_to :lesson

  class Video < Component
    before_save { |video| video.position = Video.next_position(video) unless video.position}

    def self.next_position(video)
      if Video.all.empty?
        return 0
      else
        return Video.order(:position).last + 1
      end
    end
  end

  class Document < Component
  end

  class Prezi < Component
  end

 def self.method_missing(method_id, *arguments, &block)
   if method_id == "next_position"
     classy = (arguments[0]).class
     if classy.all.empty?
       return 0
     else
       return classy.order(:position).last + 1
     end
   else
     super
   end

 end 

end
