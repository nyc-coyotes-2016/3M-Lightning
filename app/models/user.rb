class User < ActiveRecord::Base
  has_secure_password
  has_many :decks
  has_many :rounds
  has_many :cards, through: :decks
  has_many :guesses, 
end
