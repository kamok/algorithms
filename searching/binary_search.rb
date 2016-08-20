a = [1,2,6,6,7,9,13,15,98,99,130,156,552,6516]

def binary_search(array, value)
	return array[0] if array[0] == value
	return "Not found" if array.size == 1

	array = array.each_slice(array.size/2).to_a

	left, right = array[0], array[1]

	if left[-1] >= value
		binary_search(left, value)
	else 
		binary_search(right, value)
	end

	# right = array[mid +1]..array[-1]

	# if left.include?(value) 
	# 	binary_search(left, value)
	# elsif right.include?(value) 
	# 	binary_search(right, value) 
	# else
	# 	return left[-1]
	# end
end

p binary_search(a,23)
	