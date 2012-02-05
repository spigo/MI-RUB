require '../lib/Rectangle'
require 'test/unit'

class RectangleTest < Test::Unit::TestCase	
	def test_overlap
		area = overlap(Rectangle.new(4, 0, 0), Rectangle.new(2, 2, 2))
		assert_equal(19, area)
	end
	def test_not_overlap
		area = overlap(Rectangle.new(5.23, -10e20, 3e-2), Rectangle.new(4.345643225, +3e100, -1))
		assert_equal(false, area)
	end
end