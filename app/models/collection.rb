class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_vinyls
  has_many :vinyls, through: :collection_vinyls
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
