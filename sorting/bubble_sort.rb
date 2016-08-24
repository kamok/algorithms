# def bubble_sort(array)
#   n = array.length
#   loop do
#     did_any_pair_swap = false

#     (n-1).times do |i|
#       if array[i] > array[i+1]
#         array[i], array[i+1] = array[i+1], array[i]
#         did_any_pair_swap = true
#       end
#     end

#     break if did_any_pair_swap == false
#   end

#   array
# end

# p bubble_sort ([1,5,8,516,9,654,6,51])

def bubble_sort(array, swapped=false)
  (array.length-1).times { |i| (array[i], array[i+1] = array[i+1], array[i]; swapped = true) if array[i] > array[i+1] }
  swapped == false ? array : bubble_sort(array)
end

p bubble_sort ([1,5,8,516,9,654,6,51])