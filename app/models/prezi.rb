require 'open-uri'
class Prezi < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    begin
      open(url)
    rescue Exception => e
      #puts e.message
      return false
    end

    reg = /^http(s)?:\/\/prezi\.com\/([^\/]+)\/(.*)$/
    matches = (reg.match(url))? true : false

    return matches
  end

  def self.embeddableUrl(url)
    reg = /^http(s)?:\/\/prezi\.com\/([^\/]+)\/(.*)$/
    matches = reg.match(url)
    return matches[2]
  end
end
