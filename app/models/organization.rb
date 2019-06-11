class Organization < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :users
end
