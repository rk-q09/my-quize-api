class User < ApplicationRecord
    has_secure_password validations: true
    has_many :quizes, dependent: :destroy

    validates_presence_of :email
    validates_uniqueness_of :email
    validates :password, length: (8..12)
    validates :user_name, presence: true, uniqueness: true,
                          length: { maximum: 10 }
end
