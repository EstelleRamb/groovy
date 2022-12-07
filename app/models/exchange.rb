class Exchange < ApplicationRecord
    belongs_to :user
    belongs_to :requested_vinyl, class_name: "CollectionVinyl", foreign_key: :requested_vinyl_id, optional: true
    belongs_to :offered_vinyl, class_name: "CollectionVinyl", foreign_key: :offered_vinyl_id, optional: true

    enum status: {
    pending: 0,
    Confirmed: 1,
    Rejected: 2

  }
end
