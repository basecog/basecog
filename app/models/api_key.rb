class ApiKey < ApplicationRecord
  attr_readonly :key

  belongs_to :environment

  validates :name, presence: true, uniqueness: { scope: :environment_id, message: "is already taken" }

  before_create :generate_key

  private

  def generate_key
    self.key = SecureRandom.hex(64) # 128 character hexadecimal string
  end
end
