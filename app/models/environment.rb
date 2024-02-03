class Environment < ApplicationRecord
  belongs_to :project
  has_many :treatments
  has_many :api_keys

  validates :name, presence: true
end
