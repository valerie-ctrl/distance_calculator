require 'json'
require 'open-uri'

module OrderHelper
  def calculate_price(origin, destination, weight, length, width, height)
    distance = calculate_distance(origin, destination)
    volume = length * width * height / 1000000.0

    price_per_km =
      if volume < 1
        1
      elsif weight <= 10
        2
      else
        3
      end

    price_per_km * distance
  end

  def calculate_distance(origin, destination)
    api_key = "YkCsJpVFCw0S3ER9uC7vsSJrpBfEsxLW7nni34FBuTdSuQKkOL6dnNNkOF3RbS9g"
    url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&key=#{api_key}"
    data = JSON.parse(URI.open(url).read)
    data['rows'][0]['elements'][0]['distance']['value'] / 1000
  end
end
