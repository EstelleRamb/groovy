class Artist < ApplicationRecord
  has_many :vinyls

  validates :name, presence: true
  # validates :description, presence: true
end
