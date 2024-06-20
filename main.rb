require_relative 'lib/tree'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].sort.uniq
bst = Tree.new(array)
bst.pretty_print

# [1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
