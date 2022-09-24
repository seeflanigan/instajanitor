require 'uri'
require 'net/http'
require 'openssl'

# A lightweight wrapper around the ig api
class InstagramApi
  def initialize(api_key)
    @rapid_api_key = api_key
  end

  def following(ig_user_id)
    url = URI("https://instagram28.p.rapidapi.com/following?user_id=#{ig_user_id}&batch_size=1")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = 'ea9f59237dmsh2694701317f425fp1af8f5jsn9d059780ddfb'
    request["X-RapidAPI-Host"] = 'instagram28.p.rapidapi.com'
    
    response = http.request(request)
    response.read_body
  end
end
