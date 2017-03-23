class User < ActiveRecord::Base
  validates :username, uniqueness: { case_sensetive: false },
            presence: true, length: { minimum: 2, maximum: 25 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105},
            uniqueness: { case_sensetive: false },
            format: { with: VALID_EMAIL_REGEX }
end
