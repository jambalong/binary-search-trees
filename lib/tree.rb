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
   def level_order(node = self.root)
    return unless node

    queue = [node]
    visited = Array.new

    while !queue.empty?
      node = queue.shift
      next if visited.include?(node)

      visited << node
      yield node if block_given?

      children = [node&.left, node&.right].compact
      children.each do |child|
        queue << child unless visited.include?(child)
      end
    end

    visited
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
