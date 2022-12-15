class Vinyl < ApplicationRecord
  belongs_to :artist
  has_many :users_vinyls
  validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_year,
    against: [ :title, :year],
    associated_against: {
      artist: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
