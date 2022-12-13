class OfferedVinyl < ApplicationRecord
  belongs_to :exchange
  belongs_to :users_vinyl
  has_many :exchanges
end
