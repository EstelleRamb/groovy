class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :requested_vinyl, class_name: "UsersVinyl", foreign_key: :requested_vinyl_id
  belongs_to :offered_vinyl, class_name: "UsersVinyl", foreign_key: :offered_vinyl_id, optional: true
  has_many :offered_vinyls, dependent: :destroy
  # has_many :collections_vinyls, through: :offered_vinyls
  # has_many :vinyls, through: :collections_vinyls
  has_many :messages, dependent: :destroy

  enum status: {
    pending: 0,
    confirmed: 1,
    rejected: 2
  }

  validates :requested_vinyl, presence: true
end
