class FeatureFlag < ApplicationRecord
  belongs_to :project
  has_many :treatments

  validates :key, presence: true
  validates :key, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "can only contain letters, digits, hyphens (-) and underscores (_)" }
  validates :key, uniqueness: { scope: :project_id, message: "already exists" }

  scope :ordered, -> { order(key: :asc) }

  def enabled?(environment)
    treatment = Treatment.find_by(feature_flag: self, environment:)
    treatment&.enabled? || false
  end
end
