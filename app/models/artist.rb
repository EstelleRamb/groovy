class Artist < ApplicationRecord
  has_many :vinyls

  validates :name, presence: true
  # validates :description, presence: true
  include PgSearch::Model
  multisearchable against: [:title]
end
