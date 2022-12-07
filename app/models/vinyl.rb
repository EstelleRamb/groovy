class Vinyl < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_artist_and_title,
    against: [ :title, :year ],
    using: {
      tsearch: { prefix: true }
    }
end
