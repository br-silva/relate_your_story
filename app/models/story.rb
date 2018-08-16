class Story < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 65 }
  validates :body, presence: true

  def owner?(user)
    user == self.user
  end
end
