class User < ApplicationRecord
  has_secure_password

  has_one :account
  has_many :projects, through: :account

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  after_create :ensure_account

  private

  def ensure_account
    Account.create! user: self unless account
  end
end
