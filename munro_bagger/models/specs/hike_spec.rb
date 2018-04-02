require('minitest/autorun')
require_relative('../hike')


class HikeTest < MiniTest::Test

  def test_find_by_id
    assert_equal(Hike, Hike.find_by_id(3).class)
  end

  def test_all
    assert_equal(3, Hike.all().length)
  end

  # def test_update
  #   hike = Hike.find_by_id(1)
  #   hike.date = "2017-05-26"
  #   hike.update()
  #   assert_equal("2017-05-26", Hike.find_by_id(1).date)
  # end
  #
  # def test_delete
  #   hike = Hike.find_by_id(2)
  #   hike.delete()
  #   assert_equal(2, Hike.all().length)
  # end

end
