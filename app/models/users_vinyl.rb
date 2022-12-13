class UsersVinyl < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl
  has_many :exchanges, class_name: 'Exchange', foreign_key: :requested_vinyl_id

  include PgSearch::Model

  pg_search_scope :search_by_title_and_year,
    against: [ :vinyl_id],
    associated_against: {
      vinyl: [:title, :year]
    },
    using: {
      tsearch: { prefix: true }

    }
end
