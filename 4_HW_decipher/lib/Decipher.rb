class Decipher

	def decode_line(line)
		text = ""
	
		line.each_char { |character| text  += "#{(character.ord - 7).chr}" }
		return "#{text}\n"
	end
	
	def loadfile_and_decode(file)
		text = ""
		
		File.open(file,'r') do |file|
			file.each { |line| text += decode_line(line) }
		end
		
		return text
	end

end
