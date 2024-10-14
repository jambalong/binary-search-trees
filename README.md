# Binary Search Tree

This project is part of The Odin Project: [Binary Search Tree](https://www.theodinproject.com/lessons/ruby-binary-search-tree) in the Ruby curriculum.

## Assignment

You’ll build a balanced Binary Search Tree (BST) in this assignment. Ensure to avoid duplicate values, as they complicate the structure and make balancing more challenging.

### Classes

1. **Node Class**
   - Attribute for the data it stores and its left and right children.
   - Bonus: Include the `Comparable` module to compare nodes using their data attribute.

2. **Tree Class**
   - Accepts an array upon initialization.
   - Has a `root` attribute, using the return value of the `#build_tree` method.

### Methods

- **`#build_tree(data)`**
  - Takes an array of data (e.g., `[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]`).
  - Turns it into a balanced binary tree with `Node` objects appropriately placed (sort and remove duplicates).
  - Returns the level-0 root node.

- **`#pretty_print(node)`** (optional)
  - Visualizes the binary search tree.

```ruby
def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end
```

- **`#insert(value)`**
  - Accepts a value to insert into the tree.

- **`#delete(value)`**
  - Accepts a value to delete from the tree.
  - Handles multiple cases when deleting a node (e.g., nodes with children).

- **`#find(value)`**
  - Accepts a value and returns the node with that value.

- **`#level_order`**
  - Accepts a block, traverses the tree in breadth-first level order, and yields each node to the block.
  - Returns an array of values if no block is given.

- **`#inorder`**
  - Accepts a block, traverses the tree in inorder depth-first order, and yields each node to the block.
  - Returns an array of values if no block is given.

- **`#preorder`**
  - Accepts a block, traverses the tree in preorder depth-first order, and yields each node to the block.
  - Returns an array of values if no block is given.

- **`#postorder`**
  - Accepts a block, traverses the tree in postorder depth-first order, and yields each node to the block.
  - Returns an array of values if no block is given.

- **`#height(node)`**
  - Accepts a node and returns its height (the number of edges in the longest path from the node to a leaf node).

- **`#depth(node)`**
  - Accepts a node and returns its depth (the number of edges in the path from the node to the tree’s root node).

- **`#balanced?`**
  - Checks if the tree is balanced (the difference in heights of the left and right subtrees of every node is not more than 1).

- **`#rebalance`**
  - Rebalances an unbalanced tree by providing a new array to the `#build_tree` method.

## Installation Instructions

### Prerequisites

- Ensure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) installed on your system. You can verify this by running:
  ```bash
  ruby -v
  ```

### Setup

1. **Clone the Repository**
   - Use the following command to clone the repository to your local machine:
     ```bash
     git clone https://github.com/jambalong/binary-search-trees.git
     ```
   - Navigate into the project directory:
     ```bash
     cd binary-search-trees
     ```
2. **Run the Test**
   - Execute `main.rb` in order to build the balanced BST and see the outputs:
     ```bash
     ruby main.rb
     ```
     
3. **Explore the Code**: Open the project files in your preferred code editor to review or modify the code as needed.
