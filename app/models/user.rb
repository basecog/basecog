class User < ApplicationRecord
  has_one :account
  has_many :projects, through: :account

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  after_create do
    Account.create! user: self unless account
  end
end
