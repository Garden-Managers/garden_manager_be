class Coordinates
  attr_reader :zip_code, :name, :latitude, :longitude

  def initialize(data)
    @zip_code = data[:zip]
    @name = data[:name]
    @latitude = data[:lat]
    @longitude = data[:lon]
  end
end
