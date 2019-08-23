class Event < ApplicationRecord
    validates :description,  presence: true
    belongs_to :creator, class_name: 'User'
end
