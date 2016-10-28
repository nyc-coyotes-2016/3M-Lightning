require_relative "../spec_helper"

describe User do
  describe 'associations' do
    before(:each) do
      @marissa = User.create!(user_name: "mtraina27", password_digest: "devbootcamp")

      @colors_deck = Deck.create!(subject: "Colors", user_id: @marissa.id)
      @animals_deck = Deck.create!(subject: "Animals", user_id: @marissa.id)

      @card1 = Card.create!(question: "What color is the sky?", answer: "Blue", deck_id: @colors_deck.id)
      @card2 = Card.create!(question: "What color is spinach?", answer: "Green", deck_id: @colors_deck.id)
      @card3 = Card.create!(question: "Do dogs lay eggs?", answer: "No", deck_id: @animals_deck.id)

      @round1 = Round.create!(user_id: @marissa.id, deck_id: @colors_deck.id)
      @guess1 = Guess.create!(round_id: @round1.id, card_id: @card1.id, correct: "false")
      @guess2 = Guess.create!(round_id: @round1.id, card_id: @card1.id, correct: "true")

      @round2 = Round.create!(user_id: @marissa.id, deck_id: @animals_deck.id)
      @guess3 = Guess.create!(round_id: @round2.id, card_id: @card3.id, correct: "false")
      @guess4 = Guess.create!(round_id: @round2.id, card_id: @card3.id, correct: "true")
    end


    it "user can create many decks" do
      expect(@marissa.decks).to match_array [@colors_deck, @animals_deck]
    end

    it "user has many rounds" do
      expect(@marissa.rounds).to match_array [@round1, @round2]
    end

    it "user has many guesses " do
      expect(@marissa.guesses).to match_array [@guess1, @guess2, @guess3, @guess4]
    end

    it "user has many cards" do
      expect(@marissa.cards).to match_array [@card1, @card2, @card3]
    end
  end
end
