class Question < ApplicationRecord
    belongs_to :quize
    has_many :choices
    validates_presence_of :content
end
