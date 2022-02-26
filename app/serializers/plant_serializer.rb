class PlantSerializer
  include JSONAPI::Serializer
  attributes :name, :frost_date, :maturity
end 
