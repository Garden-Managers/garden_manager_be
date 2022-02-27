class UserPlantSerializer
  include JSONAPI::Serializer

  belongs_to :user, record_type: :user
  belongs_to :plant, record_type: :plant
end
