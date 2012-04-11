require 'open-uri'
class Video < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    from_youtube = url.include? 'http://youtu.be'
    page_exists = true
    begin
      open(url)
    rescue
      page_exists = false
    end
    from_youtube && page_exists
  end

  def self.embedableUrl(url)
    #"http://www.youtube.com/embed/" + url.split("/")[1]

    # url.split("src=\"")[1].split("\"")[0]

    partial_link = url.split("http://youtu.be/")[1]
    "http://www.youtube.com/embed/#{partial_link}"
  end


end
