class UserSerializer < ActiveModel::Serializer
  has_many :quizes
  attributes :user_name, :id
end
