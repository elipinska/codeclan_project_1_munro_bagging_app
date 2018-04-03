require('minitest/autorun')
require_relative('../hiker')
require_relative('../munro')


class HikerTest < MiniTest::Test

  # def test_no_munro_goal_equals_nil
  #   hiker = Hiker.find_by_id(2)
  #   assert_nil(hiker.munro_goal)
  # end

  def test_find_by_id
    assert_equal(Hiker, Hiker.find_by_id(3).class)
  end

  def test_all
    assert_equal(4, Hiker.all().length)
  end


  def test_age
    hiker = Hiker.find_by_id(1)
    assert_equal(27, hiker.age)
  end

  def test_highest_munro
    hiker = Hiker.find_by_id(1)
    assert_equal(Munro, hiker.highest_munro().class)
  end

  def test_latest_hike
    hiker = Hiker.find_by_id(1)
    assert_equal(PG::Result, hiker.latest_hike.class)
  end

  def test_most_active_hiker_indiv_hikes
    assert_equal(1, Hiker.most_active_hiker_indiv_hikes().id)
  end

  def test_most_active_hiker_unique_munros
    assert_equal(1, Hiker.most_active_hiker_unique_munros())
  end


  # def test_update
  #   hiker = Hiker.find_by_id(2)
  #   hiker.last_name = "Guziuk"
  #   hiker.update()
  #   assert_equal("Guziuk", Hiker.find_by_id(2).last_name)
  # end
  #
  # def test_delete
  #   hiker = Hiker.find_by_id(2)
  #   hiker.delete()
  #   assert_equal(2, Hiker.all.length)
  # end

end
