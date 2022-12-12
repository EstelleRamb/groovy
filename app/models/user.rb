class User < ApplicationRecord
  has_many :wishlists
  has_many :collections
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_vinyls
  has_many :vinyls, through: :users_vinyls
  has_many :exchanges

  # has_many :collections_vinyls, through: :collections

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
