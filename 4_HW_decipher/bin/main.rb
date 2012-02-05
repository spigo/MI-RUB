require '../lib/Decipher'

decipher = Decipher.new
text = decipher.loadfile_and_decode("../test/data.txt")
puts text
