require 'open-uri'
class Document < Component

  belongs_to :lesson

  def self.isValidUrl?(url)
    begin
      open(url)
    rescue Exception => e
      return false
    end

    reg = /^http(s)?:\/\/docs.google.com\/document\/pub\?id=([a-zA-Z0-9_\/-]*)$/
    match =  (reg.match(url))? true : false

    return match
  end

  def self.embedableUrl(url)
    #url something like... https://docs.google.com/document/pub?id=1...
    #convert to something like ... https://docs.google.com/document/pub?id=1...&amp;embedded=true"
    url+"&amp;embedded=true"
  end


end
