class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, uniqueness: true, length: { in: 3..20 },
                       format: { with: /\A[a-zA-Z0-9_.-]*\z/i, message: "is \
                       invalid. Only allowed letters, numbers, underscores, \
                       dashes and dots" }
end
