require_relative 'lib/tree'
require 'pry-byebug'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].sort.uniq
bst = Tree.new(array)

puts "--------------------------------"
bst.pretty_print
puts "Tree View"

bst.insert(2)
bst.insert(6)
bst.insert(13)
bst.insert(54)
bst.insert(124)
bst.insert(569)

puts "--------------------------------"
bst.pretty_print
puts "Tree View after insertions"

bst.delete(2)
bst.delete(23)
bst.delete(324)

puts "--------------------------------"
bst.pretty_print
puts "Tree View after deletions"

puts "--------------------------------"
puts "#find(3): #{bst.find(3).data}"
puts "#find(9): #{bst.find(9).data}"
puts "#find(13): #{bst.find(13).data}"
puts "#find(824): #{bst.find(824)&.data}"

puts "--------------------------------"
puts 'Level Order if block_given?'
array = Array.new
bst.level_order { |node| array << node.data }
p array

puts "--------------------------------"
puts 'Level Order unless block_given?'
p bst.level_order

puts "--------------------------------"
puts 'Inorder Traversal if block_given?'
bst.inorder { |node| print "#{node.data} " }
puts ''
puts 'Preorder Traversal if block_given?'
bst.preorder { |node| print "#{node.data} " }
puts ''
puts 'Postorder Traversal if block_given?'
bst.postorder { |node| print "#{node.data} " }
puts ''

puts "--------------------------------"
puts "Inorder Traversal unless block_given?"
p bst.inorder
puts "Preorder Traversal unless block_given?"
p bst.preorder
puts "Postorder Traversal unless block_given?"
p bst.postorder

puts "--------------------------------"
puts "#height: #{bst.height}"

target_node = bst.find(54)
puts "#depth(target_node): #{bst.depth(target_node)}"

puts "--------------------------------"
bst.pretty_print
puts "#balanced?: #{bst.balanced?}"
bst.rebalance
bst.pretty_print
puts "#balanced?: #{bst.balanced?}"

puts "--------------------------------"
puts "# Tie it all together!"
test_array = (Array.new(15) { rand(1..100) }).sort.uniq
test_bst = Tree.new(test_array)
test_bst.pretty_print
puts "Balanced? #{test_bst.balanced?}"

puts ''
puts "Inorder Traversal"
p test_bst.inorder
puts "Preorder Traversal"
p test_bst.preorder
puts "Postorder Traversal"
p test_bst.postorder

puts ''
test_bst.insert(146)
test_bst.insert(239)
test_bst.insert(393)
test_bst.pretty_print
puts "Balanced? #{test_bst.balanced?}"

puts ''
test_bst.rebalance
test_bst.pretty_print
puts "Balanced? #{test_bst.balanced?}"

puts ''
puts "Inorder Traversal"
p test_bst.inorder
puts "Preorder Traversal"
p test_bst.preorder
puts "Postorder Traversal"
p test_bst.postorder

# [1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
