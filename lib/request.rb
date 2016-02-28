# Request: get the values for a request
class Request
  def initialize(request)
    @request = request
  end

  def location
    if !@request.location.nil?
      city, country = @request.location.data['city'], @request.location.data['country_code']
    else
      city, country = ''
    end
  end
end
