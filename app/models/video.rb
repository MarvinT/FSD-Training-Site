class Video < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    url.include? 'youtube.com'
  end

  def self.embedableUrl(url)
    #"http://www.youtube.com/embed/" + url.split("/")[1]

     url.split("src=\"")[1].split("\"")[0]



  end


end
