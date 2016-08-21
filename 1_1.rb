# Implement an algorithm to determine if a string has all unique characters. 
# What if you can not use additional data structures?

def unique_char2?(string)
  string.chars.each_with_index do |char, index|
    string.chars.each_with_index do |char2, index2|
      next if index == index2
      return false if char == char2
    end
  end
  true
end

p unique_char2?("kneegrow")

def unique_char?(string)
  length = string.size
  length.times do |i|
    length.times do |i2|
      next if i == i2
      return false if string[i] == string[i2]
    end
  end
  true
end

p unique_char?("kneegrow")