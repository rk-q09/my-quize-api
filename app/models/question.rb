class Question < ApplicationRecord
    belongs_to :quize
    has_many :choices, dependent: :destroy
    validates_presence_of :content
end
