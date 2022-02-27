class ForecastSerializer
  include JSONAPI::Serializer

  def self.format_weather(data)

    {
      "attributes": {
        "current_day": {
          "min": data[:daily][0][:temp][:min],
          "max": data[:daily][0][:temp][:max],
          "weather": data[:daily][0][:weather][0][:main]
        },
        "weekly_forecast": data[:daily].drop(1).map do |daily_weather|
          {
          "dt": daily_weather[:dt],
          "min": daily_weather[:temp][:min],
          "max": daily_weather[:temp][:max],
          "weather": daily_weather[:weather][0][:main]
          }
        end
      }
    }
  end
end
