class Story < ApplicationRecord
  validates :title, length: { maximum: 65 }
  validates :body, presence: true
end
