require_relative "Node"
require 'pry'
class BinarySearchTree

  attr_reader :head, :depth

  def initialize()
    @head = nil
    @level = []
    @depth = 0
    @array = []
    @health = []
  end

  #Insert new movie titles
  #Create root node, then insert nodes
  def insert(rating, title)
    new_node = Node.new(rating, title, depth)

    if @head.nil?
      @head = new_node
      depth = @depth
    else
      insert_node(@head, new_node, @depth)
    end

    #p [@level.max].uniq.join.to_i
    new_node.depth = [@level.max].uniq.join.to_i
    #puts "Inserted: #{new_node.rating.to_s} => #{new_node.title.to_s} at level #{new_node.depth}"

    return new_node.depth
  end

  #insert nodes
  def insert_node(current_node, new_node, depth)
    if current_node.nil?  #create first node
      current_node = new_node
    elsif current_node.rating == new_node.rating #avoid duplicates
      return current_node
    end

    new_depth = depth + 1 #increase depth level when going down tree

    if new_node.rating <= current_node.rating
      current_node.left.nil? ? current_node.left = Node.new(new_node.rating, new_node.title, new_depth) : insert_node(current_node.left, new_node, new_depth)
    elsif new_node.rating > current_node.rating
      current_node.right.nil? ? current_node.right = Node.new(new_node.rating, new_node.title, new_depth) : insert_node(current_node.right, new_node, new_depth)
    end

    @level << new_depth #depth values are iterating -> throw into array then max
  end

  #check if rating is included
  def include?(rating)
     depth_of(rating) == nil ? false : true
  end

  #check depth level of rating
  def depth_of(rating)
    if rating == @head.rating
      return @head.depth
    else
      depth_traverse(rating, @head)
    end
  end

  #depth traversal
  def depth_traverse(rating, node)
    until rating == node.rating
      while rating < node.rating
        if !node.left.nil?
          node = node.left
          depth_traverse(rating, node)
        elsif rating != node.rating #value is less than current, but not equal to rating -> exit
          return nil
        else
          return node.depth
        end
      end

      while rating > node.rating
        if !node.right.nil?
          node = node.right
          depth_traverse(rating, node)
        elsif rating != node.rating
          return nil
        else
          return node.depth
        end
      end
    end
    return node.depth
  end

  #min max sort function
  def sort_min_max(root = @head, minmax)
    if minmax == "min"
      return root.left.nil? ? root.rating : sort_min_max(root.left, "min")
    elsif minmax == "max"
      return root.right.nil? ? root.rating : sort_min_max(root.right, "max")
    end
  end

  def max
    puts "The highest rating is #{sort_min_max("max").to_s}"
    sort_min_max("max")
  end

  def min
    puts "The lowest rating is #{sort_min_max("min").to_s}"
    sort_min_max("min")
  end

  #sorting traversal
  def sorter(node = @head)
    temp_hash = {}
    return if node == nil
    sorter(node.left)
    #Create Hash from node values
    temp_hash[node.rating] = node.title
    #Push hash into arrau
    @array.push(temp_hash)
    sorter(node.right)
    #p @array
  end

  def sort
    sorter
  end

  #load text file
  def load(filename)
    input = File.open(filename, "r")
    #remove whitespace and split into pairs
    text = input.read.gsub("\n", ",").split(",")
    pairs = text.each_slice(2).to_a

    pairs.each do |movie|
      if include?(movie[0].to_i)  #don't include existing ratings
        return
      else insert(movie[0].to_i, movie[1].strip)
      end
    end
  end

  #method to count children starting at node
  def count_children(node=@head)
    if node == nil
      return 0
    else
      if node.left.nil? && node.right.nil?
        return 1
      else
        return 1 + count_children(node.left) + count_children(node.right)
      end
    end
  end

  def search_at_depth(depth, node=@head)
    if depth == node.depth
      #@search << node.rating
      return node.rating
    elsif !node.left.nil?
      search_at_depth(depth, node.left)
    else !node.right.nil?
      search_at_depth(depth, node.right)
    end
    #puts @search
  end

  def health(depth)
    @health.push(search_at_depth(depth))
    @health.push(count_children)
    p @health
  end

  #count leaves
  def count_leaves_node(node = @head)
    if node == nil
      return 0
    else
      if node.left.nil? && node.right.nil? #this is the leaf
        return 1
      else
        return count_leaves_node(node.left) + count_leaves_node(node.right)
      end
    end
  end

  def count_leaves
    puts count_leaves_node
  end


  def get_height(node = @head)
    if node == nil
      return -1 #will 1 after to make it 0
    end

    left = get_height(node.left)
    right = get_height(node.right)

    if left > right
      return left + 1 #if left is biggest branch, add 1 for root
    else
      return right + 1
    end
  end

  def height
    puts get_height
  end

end
