class UsersVinyl < ApplicationRecord
  belongs_to :user
  belongs_to :vinyl
  has_many :exchanges, class_name: 'Exchange', foreign_key: :requested_vinyl_id
end
