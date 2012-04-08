class Video < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    url.include? 'http://youtu.be'
  end

  def self.embedableUrl(url)
    #"http://www.youtube.com/embed/" + url.split("/")[1]

    # url.split("src=\"")[1].split("\"")[0]

    partial_link = url.split("http://youtu.be/")[1]
    "http://www.youtube.com/embed/#{partial_link}"
  end


end
