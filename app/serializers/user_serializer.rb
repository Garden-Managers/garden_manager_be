class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :zip, :latitude, :longitude

  # def self.update_user(user)
  #   require 'pry'; binding.pry
  #   {
  #     "data": {
  #       "id": user.id,
  #       "type": "user",
  #       "attributes": {
  #         "name": user.name,
  #         "email": user.email,
  #         "zip": user.zip,
  #         "latitude": user.latitude,
  #         "longitude": user.longitude
  #       }
  #     }
  #   }
  # end

end
