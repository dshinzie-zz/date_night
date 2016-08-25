require './lib/BinarySearchTree.rb'
require 'minitest/autorun'
require 'minitest/pride'

class BinarySearchTreeTest < Minitest::Test

  @@tree = BinarySearchTree.new()
  @@new_movie = @@tree.insert(61, "Bill & Ted's Excellent Adventure")
  @@new_movie_2 = @@tree.insert(16, "Johnny English")
  @@new_movie_3 = @@tree.insert(92, "Sharknado 3")
  @@new_movie_4 = @@tree.insert(50, "Hannibal Buress: Animal Furnace")
  @@new_movie_5 = @@tree.insert(4, "The Matrix: Reloaded")
  @@new_movie_6 = @@tree.insert(12, "Silence of the Lambs")
  @@new_movie_7 = @@tree.insert(56, "Quantum Solace")

  def test_insert_new_movies

    assert_equal 0, @@new_movie
    assert_equal 1, @@new_movie_2
    assert_equal 1, @@new_movie_3
    assert_equal 2, @@new_movie_4
    assert_equal 2, @@new_movie_5
    assert_equal 3, @@new_movie_6
    assert_equal 3, @@new_movie_7

  end

  def test_include_movies

    assert @@tree.include?(16)
    refute @@tree.include?(72)
    assert @@tree.include?(92)
    assert @@tree.include?(50)
    refute @@tree.include?(1000)

  end

  def test_depth_of_score

    score_1 = @@tree.depth_of(92)
    score_2 = @@tree.depth_of(50) #fail
    score_3 = @@tree.depth_of(4)
    score_4 = @@tree.depth_of(56)

    assert_equal 1, score_1
    assert_equal 2, score_2
    assert_equal 2, score_3
    assert_equal 3, score_4

  end

  def test_depth_shows_max

    assert_equal 92, @@tree.max

  end

  def test_depth_shows_min

    assert_equal 4, @@tree.min

  end

  def test_depth_sorts

    @@tree.sorter

  end

  def test_load_movies_from_file

    @@tree.load("./lib/movies.txt")

  end

  def test_tree_shows_health
    new_tree = BinarySearchTree.new
    new_tree.insert(98, "Animals United")
    new_tree.insert(58, "Armageddon")
    new_tree.insert(36, "Bill & Ted's Bogus Journey")
    new_tree.insert(93, "Bill & Ted's Excellent Adventure")
    new_tree.insert(86, "Charlie's Angels")
    new_tree.insert(38, "Charlie's Country")
    new_tree.insert(69, "Collateral Damage")

    expected_0 = [[98, 7, 100]]
    expected_1 = [[58, 6, 85]]
    expected_2 = [[36, 2, 28], [93, 3, 42]]

    #assert equal expected_0, new_tree.health(0)
    #assert equal expected_1, new_tree.health(1)
    #assert equal expected_2, new_tree.health(2)

    new_tree.health(2)
  end

  def test_get_number_of_leaves

    @@tree.count_leaves

  end

  def test_get_height_of_tree

     @@tree.get_height

  end

end
