class User < ApplicationRecord
    before_save { self.name = name.downcase }
    validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

    has_many :events, foreign_key: :creator_id, dependent: :destroy

end
