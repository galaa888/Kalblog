class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }

  validates :username, uniqueness: { case_sensetive: false },
            presence: true, length: { minimum: 2, maximum: 25 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105},
            uniqueness: { case_sensetive: false },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password



end
