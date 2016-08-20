# def depth_first_search(adj_matrix, source_index, end_index)
#   node_stack = [source_index]

#   loop do
#     curr_node = node_stack.pop
#     return false if curr_node == nil
#     return true if curr_node == end_index

#     children = (0..adj_matrix.length-1).to_a.select do |i| 
#       adj_matrix[curr_node][i] == 1
#     end

#     node_stack = node_stack + children
#   end
# end

# adj_matrix = [
#   [0, 0, 1, 0, 1, 0],
#   [0, 0, 1, 0, 0, 1],
#   [0, 0, 0, 1, 0, 0],
#   [0, 0, 0, 0, 1, 1],
#   [0, 0, 0, 0, 0, 0],
#   [0, 0, 0, 0, 0, 0]
# ]

# p depth_first_search(adj_matrix, 0, 4)

#https://www.sitepoint.com/graph-algorithms-ruby/
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end
end

def build_tree(array, *indices)
  array.sort.uniq!
  mid = (array.length-1)/2
  first_element = indices[0]
  last_element = indices[1]

  require 'pry'
  binding.pry

  if !first_element.nil? && first_element >last_element
    return nil 
  end

  root = Node.new(array[mid])
  root.left = build_tree(array[0..mid-1], 0, mid-1)
  root.right = build_tree(array[mid+1..-1], mid+1, array.length-1)

  return root
end

def depth_first_search(search_value, tree)
  stack = [tree]
  visited = [tree]

  while !stack.empty?
    current = stack.last
    left, right = current.left, current.right

    if current.value == search_value
      puts current
      exit
    elsif !left.nil? && !visited.include?(left)
      if left.value == search_value
        puts left
        exit
      else
        visited << left
        stack << left
      end
    elsif !right.nil? && !visited.include?(right)
      if right.value == search_value
        puts right
        exit
      else
        visited << right
        stack << right
      end
    else
      stack.pop
    end
  end
  puts "nil"
end

binary_tree = build_tree([4,7,2,8,1,1,1,30,22,4,9])

# depth_first_search(7, binary_tree)