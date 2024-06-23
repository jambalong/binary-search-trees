# frozen_string_literal: true

require_relative 'node'

# Tree class
class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = (array.length - 1) / 2
    node = Node.new(array[mid])

    node.left = build_tree(array[0...mid])
    node.right = build_tree(array[mid + 1..-1])

    node
  end

  def insert(data, node = self.root)
    node ||= Node.new(data)

    case data <=> node.data
    when -1
      node.left = insert(data, node.left)
    when 1
      node.right = insert(data, node.right)
    when 0
      node
    end

    node
  end

  def delete(data, node = self.root)
    return node unless node

    case data <=> node.data
    when -1
      node.left = delete(data, node.left)
    when 1
      node.right = delete(data, node.right)
    when 0
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # Get the minimum value in the right subtree
      node.data = min_value(node.right)
      node.right = delete(node.data, node.right)
    end

    node
  end

  def find(data, node = self.root)
    return node unless node

    case data <=> node.data
    when -1
      find(data, node.left)
    when 1
      find(data, node.right)
    when 0
      node
    end
  end

  # breadth-first level order by iteration
  # def level_order(node = self.root)
  #   return [] unless node

  #   queue = [node]
  #   visited = []

  #   until queue.empty?
  #     node = queue.shift
  #     visited << node.data

  #     yield node if block_given?

  #     queue << node.left if node.left
  #     queue << node.right if node.right
  #   end

  #   visited
  # end

  # breadth-first level order by recursion
  def level_order(node = self.root, level = 0, visited = [])
    return [] unless node

    visited[level] ||= []
    visited[level] << node

    level_order(node.left, level + 1, visited)
    level_order(node.right, level + 1, visited)

    if block_given?
      visited.flatten.each { |node| yield node }
    else
      visited.flatten.map(&:data)
    end
  end

  def inorder(node = self.root, visited = [], &block)
    return [] unless node

    inorder(node.left, visited, &block)

    visited << node.data
    yield node if block_given?

    inorder(node.right, visited, &block)

    visited
  end

  def preorder(node = self.root, visited = [], &block)
    return [] unless node

    visited << node.data
    yield node if block_given?

    preorder(node.left, visited, &block)
    preorder(node.right, visited, &block)

    visited
  end

  def postorder(node = self.root, visited = [], &block)
    return [] unless node

    postorder(node.left, visited, &block)
    postorder(node.right, visited, &block)

    visited << node.data
    yield node if block_given?

    visited
  end

  def height(node = self.root)
    return -1 unless node

    left_height = height(node.left)
    right_height = height(node.right)

    1 + [left_height, right_height].max
  end

  def depth(target_node, current_node = self.root, current_depth = 0)
    return -1 unless current_node

    return current_depth if current_node == target_node

    left_depth = depth(target_node, current_node.left, current_depth + 1)
    right_depth = depth(target_node, current_node.right, current_depth + 1)

    [left_depth, right_depth].max
  end

  def balanced?(node = self.root)
    return true unless node

    left_height = height(node.left)
    right_height = height(node.right)

    (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def min_value(node)
    min_value = node.data
    while node.left
      min_value = node.left.data
      node = node.left
    end

    min_value
  end

end
