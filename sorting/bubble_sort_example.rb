sample_array = [1,6,61,8,6,658,61516,31561,15615,1565]

def bubble(sample_array)
  loop do 
    swapped = 0
    sample_array.each_with_index do |num, i|
      
      left = sample_array[i]
      right = sample_array[i+1]

      next if right == nil
      if left > right
        sample_array[i], sample_array[i+1] = sample_array[i+1] ,sample_array[i]
        swapped +=1
      end

    end
    break if swapped == 0
  end

  sample_array
end

p bubble(sample_array)