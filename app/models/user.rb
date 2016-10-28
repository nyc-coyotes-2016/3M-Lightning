class User < ActiveRecord::Base
  has_secure_password
  has_many :rounds
  has_many :decks, through: :rounds, source: :deck
  has_many :cards, through: :decks
  has_many :guesses, through: :rounds

  validates :user_name, uniqueness: true
end
