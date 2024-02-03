class ApiKey < ApplicationRecord
  belongs_to :environment

  before_create :generate_key

  validates :name, presence: true, uniqueness: { scope: :environment_id, message: "is already taken" }

  private

  def generate_key
    self.key = SecureRandom.hex(64) # 128 character hexadecimal string
  end
end
