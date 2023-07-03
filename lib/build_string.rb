# frozen_string_literal: true

class BuildString
  def rhyme
    "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
  end

  # given content, which is a string, returns array of elements. 
  # Ex: "1- the house that Jack built, 2- the malt that lay in, etc"
  def get_elements(content)
    puts "content = #{content}"
    # array of lines
    lines = content.each_line.to_a

    # elements array
    elements = []

    lines.each do |line|
      puts("line = #{line}")
      words = line.split 
      puts "words = #{words}"
      count = 0
      element = String.new
      words.each do |word|
        puts "word = #{word}"
        if word == "the"
          count += 1
        end
        puts "count = #{count}"
        if word != "This" && word != "is"
          if word[-1] != '.' && !(count == 2 && word == "the")
            # concatenate word into string variable "element"
            element << word
            element << " "
          end
        end
        # first element of rhyme 
        if word[-1] == '.'
          # remove dot from end before adding word to element string
          element << word.chop
        end
        puts "element = #{element}"
        # when we encounter the second "the", break and continue with next line
        if count == 2 && word == "the"
          break
        end
      end

      # remove space from last word of a line
      if element[-1] == " "
        element = element.chop
        puts "element! = #{element}"
      end

      elements.push(element)
      puts "elements array = #{elements}"
    end
    # return array of elements
    puts "returned elements array = #{elements}"
    elements
  end

  # given an array "elements" with all elements of the rhyme, return a string 
  # with all the elements in a random order, but the same random order on each line
  def randomize_rhyme(elements)
    # shuffle method does not modify the original array in place, it returns a modified version.
    shuffled_elements = elements.shuffle 
    output = String.new
    saved = String.new

    shuffled_elements.each do |element|
      output += "This is #{element} #{saved}.\n "
      saved = output
    end
    # return the resulting string of rhyme with randomized order of elements, excluding the final newline char
    output.chop
  end
end


# local testing
puts "Testing"

testing = BuildString.new

string = "This is the house that Jack built.
        This is the malt that lay in the house that Jack built.
        This is the rat that ate the malt that lay in the house that Jack built.
        "

output = testing.get_elements(string)

puts output
  

# This is *the house that Jack built. --> 5 
# This is the malt that lay in the house that Jack built. 
# This is the rat that ate the malt that lay in the house that Jack built.
# This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
# This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.

# 12 lines total
