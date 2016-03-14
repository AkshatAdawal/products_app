module ApplicationHelper
  #To get exitence of remote image
  def remote_img_exists?(url)
    url = URI.parse(url)
    begin
      Net::HTTP.start(url.host, url.port) do |http|
        return http.head(url.request_uri)['Content-Type'].start_with? 'image'
      end
    rescue
      return false
    end
  end
end
