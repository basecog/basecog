class Project < ApplicationRecord
  belongs_to :account
  has_many :environments, dependent: :restrict_with_exception
  has_many :feature_flags, dependent: :restrict_with_exception

  validates :name, presence: true

  after_create do
    %w[Test Production].each { |name| environments.create! name: }
  end
end
