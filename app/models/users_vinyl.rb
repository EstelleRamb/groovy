class UsersVinyl < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl
  has_many :exchanges_as_requested, class_name: 'Exchange', foreign_key: :requested_vinyl_id, dependent: :destroy
  has_many :exchanges_as_offered, class_name: 'Exchange', foreign_key: :offered_vinyl_id, dependent: :destroy
  has_many :collections_vinyls, dependent: :destroy
  include PgSearch::Model
  scope :without_user, ->(user_id) { where.not(user_id: user_id) }
  scope :available_for_trade, -> { where(offer_for_trade: true) }

  pg_search_scope :search_by_title_and_year,
    against: [ :vinyl_id],
    associated_against: {
      vinyl: [:title, :year]
    },
    using: {
      tsearch: { prefix: true }
    }
end
