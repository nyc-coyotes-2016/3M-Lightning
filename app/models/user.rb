class User < ActiveRecord::Base
  has_secure_password
  validates :password, precence: true
  validates :user_name, uniqueness: { case_sensitive: false }
  has_many :decks, :rounds
  # has_many :cards, through: :decks
  # has_many :guesses, through: :cards
end
