class Component < ActiveRecord::Base
  belongs_to :lesson

  before_save { |comp| comp.class.next_position(comp) }


  class Video < Component
  end

  class Document < Component
  end

  class Prezi < Component

  end

 def self.method_missing(method_id, *arguments, &block)
   if method_id.to_s == "next_position"
     component = arguments[0]
     classy = (arguments[0]).class
     if component.position.nil?
       if classy.all.empty?
         component.position = 1
        else
          component.position = classy.order(:position).last.position + 1
       end
     end
   else
     super
   end

 end

end
