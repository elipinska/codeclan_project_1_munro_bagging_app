require('minitest/autorun')
require_relative('../munro')


class MunroTest < MiniTest::Test

  def test_find_by_id
    assert_equal(Munro, Munro.find_by_id(2).class)
  end

  def test_all
    assert_equal(4, Munro.all().length)
  end

  def test_update
    munro = Munro.find_by_id(2)
    munro.region = "Guziuk"
    munro.update()
    assert_equal("Guziuk", Munro.find_by_id(2).region)
  end

  def test_delete
    munro = Munro.find_by_id(2)
    munro.delete()
    assert_equal(3, Munro.all.length)
  end

end
