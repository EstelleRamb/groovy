class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :requested_vinyl, class_name: "UsersVinyl", foreign_key: :requested_vinyl_id
  has_many :offered_vinyls

  enum status: {
    pending: 0,
    Confirmed: 1,
    Rejected: 2

  }
  validates :requested_vinyl, presence: true
end
