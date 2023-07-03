# frozen_string_literal: true

require 'build_string'

describe BuildString do
  subject(:jack_house) { described_class.new }

  # Reminder: use . in front of class methods, and # in front of instance methods.
  describe '.rhyme' do
    context 'jackhouse' do
      it 'returns jackhouse rhyme' do
        string = "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
        expect(jack_house.rhyme).to eq(string)
      end
    end
  end


  describe ".get_elements" do
    context "given a string" do
      it "returns array of elements in the rhyme" do
        string = "This is the house that Jack built.
        This is the malt that lay in the house that Jack built.
        This is the rat that ate the malt that lay in the house that Jack built.
        This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
        "

        elements_array = ["the house that Jack built", "the malt that lay in",
        "the rat that ate", "the cat that killed", "the dog that worried", 
        "the cow with the crumpled horn that tossed", "the maiden all forlorn that milked",
        "the man all tattered and torn that kissed", "the priest all shaven and shorn that married",
        "the rooster that crowed in the morn that woke", "the farmer sowing his corn that kept",
        "the horse and the hound and the horn that belonged to"]
        
        expect(jack_house.get_elements(string)).to eq(elements_array)
      end 
    end
  end

  # NOTE: what would the output equal to (it's random)?

  # describe ".randomize_rhyme" do
  #   context "given an array of elements" do
  #     it "returns a string of a randomized rhyme"
  #       expect(jack_house.randomize_rhyme(elements_array)).to eq()
  #     end
  #   end
  # end


end
