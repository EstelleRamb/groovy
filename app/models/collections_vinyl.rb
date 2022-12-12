class CollectionsVinyl < ApplicationRecord
  # scope :user_to_exchange, ->(user) { joins(collection: :user).where(offer_for_trade: true).where(users: { id: user.id })}

  belongs_to :collection
  belongs_to :users_vinyl
  # has_one :user, through: :collection
end
