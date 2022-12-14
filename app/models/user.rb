class User < ApplicationRecord
  has_many :wishlists
  has_many :collections
  has_many :collections_vinyls, through: :collections
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_vinyls
  has_many :users_vinyls_to_exchange, -> { where offer_for_trade: true }, class_name: 'UsersVinyl', foreign_key: :user_id
  has_many :vinyls, through: :users_vinyls
  has_many :vinyls_to_exchange, through: :users_vinyls_to_exchange, class_name: 'Vinyl', source: :vinyl

  has_many :exchanges
  has_many :incoming_exchanges, through: :users_vinyls, source: :exchanges_as_requested
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
