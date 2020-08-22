class Quize < ApplicationRecord
    has_many :questions, dependent: :destroy
    belongs_to :user
    validates :title, presence: true, length: { maximum: 12 }
end
