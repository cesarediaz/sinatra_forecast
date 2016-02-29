class City < ActiveRecord::Base
  serialize :body, Hash

  def self.save(city_weather)
    if city = find_by_city_id(city_weather['city']['id'])
      city.update_attributes(body: city_weather)
    else
      city = city_weather['city']['name'].upcase
      country_code = city_weather['city']['country'].upcase
      create(city_id: city_weather['city']['id'], body: city_weather, name: city, country_code: country_code)
    end
  end

  def self.exist?(city_id = nil, name = nil, country_code = nil)
    city = where('(name = ? AND country_code = ?) OR city_id = ?', name.upcase, country_code.upcase, city_id).first
    city ? recently_updated?(city) : false
  end

  def self.recently_updated?(city)
    city.updated_at + 5.minutes > Time.now.getutc ? true : false
  end
end
