class Rectangle
	attr_accessor :edge_length, :x, :y

	def initialize(edge_length, x, y)
		@edge_length = Float(edge_length)
		@x = Float(x)
		@y = Float(y)
	end
end

def load_rectangle()
	
	begin
		print "Zadejte delku hrany ctverce: "
		edge_length = Float(gets)
		
		if (edge_length < 0)
			raise "Spatny vstup."
		end
	
		print "Zadejte x-ovou souradnici stredu ctverce: "
		x = Float(gets)
		
		raise ArgumentError if x < 0
		
		print "Zadejte y-ovou souradnici stredu ctverce: "
		y = Float(gets)

	rescue Exception => e  

		puts e.message

	rescue ArgumentError => e
		
		puts "Spatny vstup."

	end
	  
	return Rectangle.new(edge_length, x, y)
end

def overlap(rect1, rect2)
	
	begin
		overlap_x = rect1.edge_length/2 - rect2.edge_length/2 - (rect1.x - rect2.x).abs
		overlap_y = rect1.edge_length/2 - rect2.edge_length/2 - (rect1.y - rect2.y).abs
		
		if (overlap_x > 0 || overlap_y > 0)
	    	raise "Ctverce se ani nedotykaji."
		end
				
		area = (rect1.edge_length * rect1.edge_length) + (rect2.edge_length * rect2.edge_length) - (overlap_x * overlap_y)
		
		if area < 0
			raise "Ctverce se ani nedotykaji."
		end
		
		puts "Obsah sjednoceni dvou ctvercu je  #{area}."

	rescue Exception => e

		puts e
		return false
		
	end
	
	return area
end