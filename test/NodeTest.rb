require './lib/Node.rb'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test
  def test_node_can_hold_data
    node = Node.new("1")
    expected = "1"

    assert_equal expected, node.data
  end

  def test_node_starts_with_no_link
    node = Node.new("1")
    expected = nil

    assert_equal expected, node.left
  end
end
