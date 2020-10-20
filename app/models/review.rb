class Review < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    validates :title, :content, presence: true
end
