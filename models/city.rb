class City < ActiveRecord::Base
  serialize :body, Hash

  def self.save(city_weather)
    if city = find_by_city_id(city_weather['city']['id'])
      city.update_attributes(body: city_weather)
    else
      create(city_id: city_weather['city']['id'], body: city_weather)
    end
  end
end
