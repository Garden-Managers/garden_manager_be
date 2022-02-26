class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :zip
end 
