class PigLatinizer

  attr_accessor :phrase

  @@vowels = ["a","e","i","o", "u"]

  def initialize
    @phrase = phrase
  end

  def piglatinize_sentence(sentence)
    arr = sentence.split(" ")
    new_arr = arr.map do |word|
      self.piglatinize_word(word)
    end
    new_arr.join(" ")
  end

  def piglatinize_word(word)
    arr = word.split('')

    if @@vowels.detect{|v| v == arr[0].downcase}
	     arr << ["w", "a", "y"]
       new_word = arr.flatten.join("")
     elsif @@vowels.detect{|v| v != arr[0].downcase && v == arr[1].downcase}
       first_letter = arr.shift
       arr << ["#{first_letter}", "a", "y"]
       new_word = arr.flatten.join("")
     else
       vowel = arr.find{|letter| @@vowels.include?(letter)}
       vowel_index = arr.index("#{vowel}")
       prefix = arr.shift(vowel_index.to_i)
       suffix = prefix << ["a", "y"]
       arr << suffix
       new_word = arr.flatten.join("")
     end
   new_word
  end

  def piglatinize(phrase)
    if phrase.match(/\s/)
      self.piglatinize_sentence(phrase)
    else
      self.piglatinize_word(phrase)
    end
  end

end
