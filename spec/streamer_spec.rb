require 'elevator_media'
require 'spec_helper'
require 'excon'

describe ElevatorMedia::Streamer do
  describe '.get_weather' do
    it 'gets Montreal weather from openweather API' do
      uri =
        URI(
          "https://api.openweathermap.org/data/2.5/weather?q=Montreal&appid=#{
            ENV['WEATHER_API_KEY']
          }"
        )

      response = Net::HTTP.get(uri)

      expect(response).to be_an_instance_of(String)
    end
  end
  describe '.convert_temperature' do
    it 'substracts 273.15 from a temperature in kelvin units to convert it to celsius' do
      expect(ElevatorMedia::Streamer.convert_temperature(300)).to eq(26.85)
      expect(ElevatorMedia::Streamer.convert_temperature(273.15)).to eq(0)
      expect(ElevatorMedia::Streamer.convert_temperature(250)).to eq(-23.15)
    end
  end

  describe '.dynamic_message' do
    it 'returns a string based on the celsius temperature provided' do
      expect(ElevatorMedia::Streamer.dynamic_message(0)).to eq("It's cold! Brr")
      expect(ElevatorMedia::Streamer.dynamic_message(-20)).to eq(
        "It's cold! Brr"
      )
      expect(ElevatorMedia::Streamer.dynamic_message(1)).to eq(
        "It's a bit chilly out there!"
      )
      expect(ElevatorMedia::Streamer.dynamic_message(15)).to eq(
        'Enjoy the awesome weather today!'
      )
      expect(ElevatorMedia::Streamer.dynamic_message(20)).to eq(
        'Enjoy the awesome weather today!'
      )
    end
  end
end
