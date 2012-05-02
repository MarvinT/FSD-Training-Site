require 'open-uri'
class Video < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    reg = /http:\/\/youtu.be\/([a-zA-Z0-9\-\/\_])*$/
    super(url, reg)
end

  def self.embedableUrl(url)
   
    partial_link = url.split("http://youtu.be/")[1]
    "http://www.youtube.com/embed/#{partial_link}"
  end


end
