require 'excon'
require 'json'
module ElevatorMedia
  class Streamer
    def self.get_weather
      begin
        response = Excon.get("#{ENV['WEATHER_ENDPOINT']}")
        return JSON.parse(response.body)['main']['feels_like']
      rescue Excon::Error => e
        puts e
      end
    end

    def self.convert_temperature(kelvin_temp)
      celsius_temp = kelvin_temp - 273.15
      return celsius_temp.round(2)
    end

    def self.dynamic_message(temp)
      if temp <= 0
        return "It's cold! Brr"
      elsif temp > 0 && temp < 15
        return "It's a bit chilly out there!"
      elsif temp >= 15
        return 'Enjoy the awesome weather today!'
      end
    end

    def self.get_content
      k_temperature = get_weather
      c_temperature = convert_temperature(k_temperature)
      dynamic_message = dynamic_message(c_temperature)
      html_string =
        "<span>Current temperature: #{c_temperature} - #{
          dynamic_message
        }</span>"
      return htmt_string
    end
  end
end
