class City < ActiveRecord::Base
  serialize :body, Hash

  scope :find_city, -> (name, country_code, city_id) do
    where('(name = ? AND country_code = ?) OR city_id = ?',
          name.upcase,
          country_code.upcase,
          city_id)
  end

  def self.save(city_weather)
    if city = find_by_city_id(city_weather['city']['id'])
      city.update_attributes(body: city_weather)
    else
      create(city_id: city_weather['city']['id'],
             body: city_weather,
             name: city_weather['city']['name'].upcase,
             country_code: city_weather['city']['country'].upcase)
    end
  end

  def self.exist?(city_id = nil, name = nil, country_code = nil)
    city = find_city(name, country_code, city_id).first
    city ? recently_updated?(city) : false
  end

  def self.recently_updated?(city)
    city.updated_at + 5.minutes > Time.now.getutc ? true : false
  end
end
