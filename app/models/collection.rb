class Collection < ApplicationRecord
  belongs_to :user
  has_many :collections_vinyls
  has_many :vinyls, through: :collections_vinyls
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
end
