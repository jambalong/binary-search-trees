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
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid + 1..-1])

    root
  end

  def insert(data, root = self.root)
    root ||= Node.new(data)

    case data <=> root.data
    when 0
      return root
    when -1
      root.left = insert(data, root.left)
    when 1
      root.right = insert(data, root.right)
    end

    root
  end

  def delete(data, root = self.root)
    return root unless root

    case data <=> root.data
    when -1
      root.left = delete(data, root.left)
    when 1
      root.right = delete(data, root.right)
    when 0
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      # Get the minimum value in the right subtree
      root.data = min_value(root.right)
      root.right = delete(root.data, root.right)
    end

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def min_value(root)
    min_value = root.data
    while root.left
      min_value = root.left.data
      root = root.left
    end

    min_value
  end

end
