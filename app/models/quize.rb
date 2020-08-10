class Quize < ApplicationRecord
    has_many :questions, dependent: :destroy
    belongs_to :user
    validates_presence_of :title
end
