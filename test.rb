# def permutation(string)
#   return [''] if string.empty?

#   chrs = string.chars
#   (0...string.size).flat_map { |i|
#     chr, rest = string[i], string[0...i] + string[i+1..-1]
#     permutation(rest).map { |sub|
#       chr + sub
#     }
#   }
# end

# p permutation("kam")

def duplicates?(array1)
  array1.each_with_index do |item1, index1|
    array1.each_with_index do |item2, index2|
      next if index1 == index2
      return true if item1 == item2
    end
  end
  false
end
 
p duplicates?([1,2,3,5,1])