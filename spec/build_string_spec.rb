require "build_string"

describe BuildString do
  subject(:jack_house) {described_class.new }
  
  describe BuildString do
      # Reminder: use . in front of class methods, and # in front of instance methods.
      describe ".rhyme" do 
          context "given an empty string" do
          # it keyword marks specific test case/expected behavior
            it "returns empty string" do
              expect(jack_house.rhyme("")).to eq("")
            end
          end

          context "given non-empty string" do
              it "returns given non-empty string" do

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
                  expect(jack_house.rhyme(string)).to eq(string)
              end
          end
      end
  end
end
