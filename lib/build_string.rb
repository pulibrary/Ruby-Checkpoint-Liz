class BuildString
  attr_reader :rhyme
  def initialize
    @rhyme = "This is the house that Jack built.\nThis is the malt that lay in the house that Jack built.\nThis is the rat that ate the malt that lay in the house that Jack built.\nThis is the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\nThis is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
  end

  # given a rhyme, which is a string, returns array of elements. 
  # Ex: "1- the house that Jack built, 2- the malt that lay in, etc"
  def get_elements
    lines = @rhyme.each_line.to_a
    elements = []
    # number of words in previous element
    prev_length = 0

    lines.each do |line|
      words = line.split 
      diff = words.length - prev_length
    
      string, prev_length = get_element_in_line(diff, words, prev_length)

      elements.push(string)
    end
    elements
  end
  
  # returns "new" element within 1 line of rhyme, 
  # i.e. excludes "This is" and repeated elements from previous lines.
  def get_element_in_line(diff, words, prev_length)
    element = []
    (diff).times do |i|
      next if words[i] == "This" || words[i]== "is"
      # concatenate word into element string
      element << words[i]
    end
    prev_length += element.length
    string = element.join(" ")
    
    if string[-1] == "."
      string = string.chop
    end
    return [string, prev_length]
  end

  # given a rhyme as a string, return randomized version.
  def randomize_rhyme
    elements = get_elements
    # shuffle method does not modify the original array in place, it returns a modified version.
    shuffled_elements = elements.shuffle 

    # return the resulting string of rhyme with randomized order of elements,
    # excluding the final newline char
    concat_elements(shuffled_elements)
  end

  # helper method of randomize_rhyme to maintain pattern despite being random
  def concat_elements(shuffled_elements)
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
    end
    output.chop
  end

  # pass a string (rhyme) and confirm that it has correct pattern
  def validate_rhyme(string)
    lines = string.each_line.to_a
    saved = []
    saved_length = 0

    lines.each do |line|
      words = line.split
      line_length = words.length
      diff = line_length - saved_length

      check = validate_first_words(words)
      return false if check == false

      check = validate_last_part(words, saved, diff, line_length)
      return false if check == false

      saved = validate_save_middle_part(line_length, words)
      saved_length = saved.length
    end
    true
  end

  # check "This" and "is" are the two first words 
  def validate_first_words(words)
    if words[0] != "This" || words[1] != "is"
      return false
    end
  end

  # check if the last part of the line matches what we saved
  def validate_last_part(words, saved, diff, line_length)
    j = 0
    i = diff
    while i >= diff && i < line_length
      if words[i] != saved[j] 
        return false
      end
      j += 1
      i += 1
    end
  end

  # save middle part of line (new component of rhyme) 
  def validate_save_middle_part(line_length, words)
    saved = []
    i = 2
      while i < line_length
        saved << words[i]
        i += 1
      end
      return saved
  end
end
