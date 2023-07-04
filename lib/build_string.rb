# frozen_string_literal: true

class BuildString
  def rhyme
    "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
  end

  # given a rhyme, which is a string, returns array of elements. 
  # Ex: "1- the house that Jack built, 2- the malt that lay in, etc"
  def get_elements(string)
    # array of lines
    lines = string.each_line.to_a

    # elements array
    elements = []

    # number of words in previous element
    prev_length = 0

    lines.each do |line|
      # puts "line = #{line}"
      words = line.split 
      # puts "words = #{words}"
      # count = 0
      element = []
      # number of words in current line
      curr_length = words.length
      # puts "prev_length = #{prev_length}"
      # puts "curr_length = #{curr_length}"
      diff = curr_length - prev_length
      # puts "diff = #{diff}"

      (diff).times do |i|
        next if words[i] == "This" || words[i]== "is"
        # concatenate word into element string
        element << words[i]
        # puts "element = #{element}"
      end
      prev_length += element.length
      string = element.join(" ")
      
      if string[-1] == "."
        string = string.chop
      end

      elements.push(string)
      # puts "elements array = #{elements}"
    end
    # return array of elements
    # puts "returned elements array = #{elements}"
    elements
  end

  # given an array "elements" with all elements of the rhyme, return a string 
  # with all the elements in a random order, but the same random order on each line
  def randomize_rhyme(rhyme)
    elements = get_elements(rhyme)
    puts "elements = #{elements}"
    # shuffle method does not modify the original array in place, it returns a modified version.
    shuffled_elements = elements.shuffle 
    puts "shuffled = #{shuffled_elements}"
    output = ""
    saved = ""

    shuffled_elements.each do |element|
      if saved == ""
        output += "This is #{element}.\n"
        saved = "#{element}"
      else
        output += "This is #{element} #{saved}.\n "
        saved = "#{element} #{saved}"
      end
      puts "output = #{output}"
    end
    # return the resulting string of rhyme with randomized order of elements,
    # excluding the final newline char
    output.chop
  end

  # pass a string (rhyme) and confirm that it has correct pattern
  def validate_rhyme(string)
    lines = string.each_line.to_a
    saved = []
    saved_length = 0

    lines.each do |line|
      words = line.split
      puts "line of words = #{words}"

      line_length = words.length
      diff = line_length - saved_length
      puts "diff = #{diff}"
      puts "saved_length = #{saved_length}"

      # check "This" and "is" are the two first words
      if words[0] != "This" || words[1] != "is"
        return false
      end

      # check if the last part of the line matches what we saved
      j = 0
      i = diff
      while saved and i >= diff && i < line_length
        puts "words[i] = #{words[i]}"
        puts "saved[j] = #{saved[j]}"
        if words[i] != saved[j] 
          return false
        end
        j += 1
        i += 1
      end

      # save middle part (new component of rhyme)
      saved = []
      i = 2
        while i < line_length
          saved << words[i]
          i += 1
        end

      puts "saved = #{saved}"
      saved_length = saved.length
    end
    # return true: pattern matched
    true

  end
end


# local testing
puts "Testing"

testing = BuildString.new

# string = "This is the man all tattered and torn that kissed.\nThis is the horse and the hound and the horn that belonged to the man all tattered and torn that kissed.\nThis is the cat that killed the horse and the hound and the horn that belonged to the man all tattered and torn that kissed."

song = "This is the man all tattered and torn that kissed.\nThis is the princess that waved to the man all tattered and torn that kissed."

# local testing for randomize_rhyme method
randomized = testing.randomize_rhyme(song)
puts "randomized = #{randomized}"

# string = "This is the house that Jack built.
# This is the malt that lay in the house that Jack built.
# This is the rat the great that ate the malt that lay in the house that Jack built."

# boolean = testing.validate_rhyme(randomized)
# puts "validated: #{boolean}"
# puts "randomized is equal to original? #{song == randomized}"

# This is *the house that Jack built. --> 5 
# This is the malt that lay in *the house that Jack built. --> middle: 2 to 6, total of 12, prev of 5, 12-5 = 7 - 1
                                                              # middle = 2 to length-prev.length-1
                                                              # last = length-prev.length to length-1
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

