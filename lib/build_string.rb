# frozen_string_literal: true

# generates non-random and random rhyme based on Jack House's rhyme.
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

  # returns new element within 1 line of rhyme,
  # i.e. excludes "This is" and repeated elements from previous lines.
  def get_element_in_line(diff, words, prev_length)
    element = []
    diff.times do |i|
      next if words[i] == 'This' || words[i] == 'is'

      # concatenate word into element string
      element << words[i]
    end
    prev_length += element.length
    string = element.join(' ')

    string = string.chop if string[-1] == '.'
    [string, prev_length]
  end

  # given a rhyme as a string, return semi-random version that ends with
  # “the house that Jack built.” at the end of the entire rhyme.
  def semi_randomize_rhyme
    elements = get_elements

    # shuffle method does not modify the original array in place, it returns a modified version.
    shuffled_elements = elements.shuffle

    # return the resulting string of rhyme with randomized order of elements,
    # excluding the final newline char
    concat_elements(shuffled_elements, semi: true)
  end

  # checks that semi-randomized rhyme 'string' ends with 'the house that Jack built.'
  def validate_semi_random_rhyme(string)
    lines = string.each_line.to_a
    # words in the last line of rhyme
    last_line = lines[-1].split
    last_line_length = last_line.length

    check = 'the house that Jack built.'
    check_words = check.split

    # 'check' phrase length is 5 words
    diff = last_line_length - 5
    j = 0
    last_phrase = last_line[diff..]

    last_phrase.each do |word|
      return false if word != check_words[j]

      j += 1
    end
    true
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
  def concat_elements(shuffled_elements, semi: false)
    output = ''
    saved = ''
    shuffled_elements.each do |element|
      if saved == ''
        output += "This is #{element}.\n"
        saved = element.to_s
      elsif shuffled_elements.last == element && semi == true
        output += "This is #{element} #{saved} the house that Jack built."
        return output
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

      return false unless validate_first_words(words)
      return false unless validate_last_part(words, saved, diff, line_length)

      saved = save_middle_part(line_length, words)
      saved_length = saved.length
    end
    true
  end

  # check "This" and "is" are the two first words
  def validate_first_words(words)
    return false if words[0] != 'This' || words[1] != 'is'

    true
  end

  # check if the last part of the line matches what we saved
  def validate_last_part(words, saved, diff, line_length)
    j = 0
    i = diff
    while i >= diff && i < line_length
      return false if words[i] != saved[j]

      j += 1
      i += 1
    end
    true
  end

  # save middle part of line (new component of rhyme) to concat to next line
  def save_middle_part(line_length, words)
    saved = []
    i = 2
    while i < line_length
      saved << words[i]
      i += 1
    end
    saved
  end
end
