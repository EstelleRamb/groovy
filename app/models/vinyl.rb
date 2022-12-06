class Vinyl < ApplicationRecord
  belongs_to :artist
  belongs_to :genre


  validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
end
