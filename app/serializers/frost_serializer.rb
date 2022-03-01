class FrostSerializer
  include JSONAPI::Serializer

  def self.format_frost_dates(spring, fall)
    [
      {
        "season": "fall",
        "temperature_threshold": "32",
        "prob_50": "#{fall}"
      },
      {
        "season": "spring",
        "temperature_threshold": "32",
        "prob_50": "#{spring}"
      }
    ]
  end
end
