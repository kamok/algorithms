# #MAKE faster by ensuring pivot is chosen near the center of the array

# def quicksort(*ary)
#   return [] if ary.empty?

#   pivot = ary.delete_at(rand(ary.size))
#   left, right = ary.partition(&pivot.method(:>))

#   return *quicksort(*left), pivot, *quicksort(*right)
# end

# p quicksort(1,2,5,8,961,6,196,8,1,236,6)

sample = [1,2,5,8,961,6,196,8,1,236,6]

def quicksort_2(array)
  return array if array.length <= 1

  pivot = array.delete_at(rand(array.size))
  left , right = array.partition { |num| pivot > num }
  return *quicksort_2(left), pivot, *quicksort_2(right) 
end

p quicksort_2(sample)