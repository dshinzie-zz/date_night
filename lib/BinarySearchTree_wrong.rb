require_relative "Node"
require 'pry'
class BinarySearchTree
    #Scores are integers between 0 and 100
    #No two movies will get the same score
    #All nodes to the left have elements with a value less or lower than this node's data element.
    #All nodes to the right have elements with a value more or greater than this node's data element.
  attr_reader :head, :depth


  def initialize()
    @head = nil
    @level = 0
    @next_level = 0
  end

  def insert(rating, title)
    new_node = Node.new(rating, title)

    if @head.nil?
      @head = new_node
    else
      insert_node(@head, new_node)
    end

    # @level = 0
    # level = get_node_level(new_node.rating)
    #
    # return level

    #return get_node_level(@head, new_node, 0) if new_node.rating == 50
    puts get_node_level(@head, new_node, 0).to_s if new_node.rating == 50
    #p get_node_level(@head, new_node, 0) if new_node.rating == 50
    #puts get_node_level(@head, new_node, 0)



    # if @head == new_node
    #   puts "Initialized with: #{rating.to_s} => #{title} at level #{level}"
    # else
    #   puts"Inserted: #{new_node.rating.to_s} => #{new_node.title.to_s} at level #{level}"
    # end

  end

  def insert_node(current_node, new_node)

    if current_node.nil?  #create first node
      current_node = new_node
    elsif current_node.rating == new_node.rating #avoid duplicates
      return current_node
    end

    if new_node.rating <= current_node.rating
      current_node.left.nil? ? current_node.left = Node.new(new_node.rating, new_node.title) : insert_node(current_node.left, new_node)

    elsif new_node.rating > current_node.rating
      current_node.right.nil? ? current_node.right = Node.new(new_node.rating, new_node.title) : insert_node(current_node.right, new_node)
    end

  end

  def get_node_level(root, node, level)

    return nil if node.nil?

    if node.rating == @head.rating
      level = 0
    elsif node.rating < root.rating
      level += 1
      get_node_level(root.left, node, level)
      return level
    elsif node.rating > root.rating
      level += 1
      get_node_level(root.right, node, level)
      puts level
      return level
    else
      return level
    end

    return level if root.rating == node.rating
      #binding.pry

  end

  end


  def include?(rating)
     get_node_level(rating) == nil ? false : true
  end

  def depth_of(root, node, height)



    next_height = height + 1

    return nil if root.nil?
    return height if root.rating == node.rating

    binding.pry
    level1 = depth_of(root.left, node, next_height)

    return level1 if level1 != 0

    binding.pry

    return depth_of(root.right, node, next_height)

    puts level1

  end




  def max



  end
  def min

  end
  def sort

  end
  def load

  end
  def health

  end
  def leaves

  end
  def height

  end
end
