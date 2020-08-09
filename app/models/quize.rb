class Quize < ApplicationRecord
    has_many :questions
    belongs_to :user
    validates_presence_of :title
end
