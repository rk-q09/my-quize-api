class QuestionSerializer < ActiveModel::Serializer
  attributes :content, :id
  has_many :choices
end
