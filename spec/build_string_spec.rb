require 'build_string'

describe BuildString do
  subject(:jack_house) { described_class.new }

  # Reminder: use . in front of class methods, and # in front of instance methods.
  describe '#rhyme' do
    context 'jackhouse' do
      it 'returns jackhouse rhyme' do
        string = "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
        expect(jack_house.rhyme).to eq(string)
      end
    end
  end

  describe "#get_elements" do
    context "given a rhyme as a string, if method successfully extracts elements of rhyme" do
      it "returns true" do
        string = "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."

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


  describe "#validate_rhyme" do
    context "given a valid rhyme as a string" do
      it "returns true" do

        string = "This is the man all tattered and torn that kissed.\nThis is the horse and the hound and the horn that belonged to the man all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."

        expect(jack_house.validate_rhyme(string)).to eq(true)
      end
    end

    context "given an invalid rhyme as a string: has 'es' " do
      it "returns false" do
        string = "This is the man all tattered and torn that kissed.\nThis es the horse and the hound and the horn that belonged to the man all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."
        expect(jack_house.validate_rhyme(string)).to eq(false)
      end
    end

    context "given an invalid rhyme as a string: has 'cow' " do
      it "returns false" do
        string = "This is the man all tattered and torn that kissed.\nThis is the cow and the hound and the horn that belonged to the man all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."
        expect(jack_house.validate_rhyme(string)).to eq(false)
      end
    end

  end

  # Note: if the string has few elements, like two, it is very likely that the
  # randomized rhyme will equal the original. Future work: create a new function that 
  # ensures the randomized rhyme is not equal to the original regardless of the number 
  # of elements in the rhyme.
  describe "#randomize_rhyme" do
    context "given a randomized rhyme with valid patterns" do
      it "returns true" do
        string = "This is the man all tattered and torn that kissed.\nThis is the horse and the hound and the horn that belonged to the man all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."
        randomized = jack_house.randomize_rhyme(string)
        expect(jack_house.validate_rhyme(randomized)).to eq(true)
      end
    end
 
    context "given a randomized rhyme with invalid patterns" do
      it "returns false" do
        randomized = "This is the man all tattered and torn that kissed.\nThis is the horse and the hound and the horn that belonged to the woman all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."        
        expect(jack_house.validate_rhyme(randomized)).to eq(false)
      end
    end
  end

end

 