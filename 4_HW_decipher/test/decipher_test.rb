require '../lib/Decipher'
require 'test/unit'


class DecipherTest < Test::Unit::TestCase
	
	def test_decipher
		
		decipher = Decipher.new
		data = decipher.loadfile_and_decode("data.txt")
		assert_equal("*CDC is the trademark of the Control Data Corporation.\x03\n*IBM is a trademark of the International Business Machine Corporation.\x03\n*DEC is the trademark of the Digital Equipment Corporation.\n", data) 
	end
	
end