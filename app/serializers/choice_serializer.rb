class ChoiceSerializer < ActiveModel::Serializer
  attributes :content, :is_answer, :id
  belongs_to :question
end
