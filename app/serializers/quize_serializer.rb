class QuizeSerializer < ActiveModel::Serializer
  has_many :questions
  attributes :title, :id
end
