class Question < ApplicationRecord
    belongs_to :quize
    has_many :choices, dependent: :destroy
    validates :content, presence: true, length: { maximum: 30 }
end
