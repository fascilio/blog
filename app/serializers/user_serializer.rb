class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :secondname, :username, :email
end
