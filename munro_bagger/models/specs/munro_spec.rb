require('minitest/autorun')
require_relative('../munro')
require_relative('../hiker')


class MunroTest < MiniTest::Test

  def test_find_by_id
    assert_equal(Munro, Munro.find_by_id(3).class)
  end

  def test_all
    assert_equal(4, Munro.all().length)
  end

  def test_all_hikers
    munro = Munro.find_by_id(3)
    assert_equal(1, munro.all_hikers().length)
  end

  # def test_update
  #   munro = Munro.find_by_id(1)
  #   munro.region = "Cairngorms"
  #   munro.update()
  #   assert_equal("Cairngorms", Munro.find_by_id(1).region)
  # end
  #
  # def test_delete
  #   munro = Munro.find_by_id(2)
  #   munro.delete()
  #   assert_equal(3, Munro.all().length)
  # end

end
