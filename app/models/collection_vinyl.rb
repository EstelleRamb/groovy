class CollectionVinyl < ApplicationRecord
  scope :user_to_exchange, ->(user) { joins(collection: :user).where(offer_for_trade: true).where(users: { id: user.id })}

  belongs_to :vinyl
  belongs_to :collection
  has_one :user, through: :collection
end
