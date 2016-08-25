class Node
  attr_accessor :rating, :title, :left, :right, :depth

  def initialize(rating, title, depth)
    @rating = rating
    @title = title
    @left = left
    @right = right
    @depth = depth
  end
end
