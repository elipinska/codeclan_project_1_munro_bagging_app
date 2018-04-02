require('minitest/autorun')
require_relative('../hiker')


class HikerTest < MiniTest::Test

  def test_find_by_id
    assert_equal(Hiker, Hiker.find_by_id(3).class)
  end

  def test_all
    assert_equal(3, Hiker.all().length)
  end

  def test_update
    hiker = Hiker.find_by_id(2)
    hiker.last_name = "Guziuk"
    hiker.update()
    assert_equal("Guziuk", Hiker.find_by_id(2).last_name)
  end

  def test_delete
    hiker = Hiker.find_by_id(2)
    hiker.delete()
    assert_equal(2, Hiker.all.length)
  end

end
