class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}
  has_many :orders
  has_many :reviews
  has_many :carts
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_blank: true

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create! do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      # user.password = auth.credentials.token
      user.password_digest = auth.credentials.token
    end
  end
end
