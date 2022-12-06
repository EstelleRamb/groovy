class Exchange < ApplicationRecord
    belongs_to :user
    belongs_to :requested_vinyl, class_name: "CollectionVinyl", foreign_key: :requested_vinyl_id, optional: true
    belongs_to :offered_vinyl, class_name: "CollectionVinyl", foreign_key: :offered_vinyl_id, optional: true
end
