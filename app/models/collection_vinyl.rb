class CollectionVinyl < ApplicationRecord
  belongs_to :vinyl
  belongs_to :collection
  has_one :user, through: :collection
end
