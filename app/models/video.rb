class Video < Component
  def self.isValidUrl?(url)
    url.include? 'youtube.com'
  end
end
