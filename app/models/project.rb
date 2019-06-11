class Project < ApplicationRecord
  belongs_to :organization
  has_many :tests, dependent: :destroy
end
