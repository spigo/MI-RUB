
class Array
	def power_set
		yield [] if block_given?
		self.inject([[]]) do |ps, elem|
			r = []
			ps.each do |i|
				r << i
				new_subset = i + [elem]
				yield new_subset if block_given?
				r << new_subset
				end
			r
		end
	end
end

class Knapsack
	
	KnapsackItem = Struct.new(:name, :weight, :value)

	def knapsack_bruteforce(file)
		
		instances_count = File.foreach(file).inject(0) {|c, line| c+1}
		 
		def knap(potential_items, knapsack_capacity)
		
			fval = 0
			maxval = 0
			solutions = []

			potential_items.power_set do |subset|
				weight = subset.inject(0) {|w, elem| w += elem.weight}
				next if weight > knapsack_capacity

				value = subset.inject(0) {|v, elem| v += elem.value}
			  	
				if value == maxval
					solutions << subset
				elsif value > maxval
					maxval = value
					solutions = [subset]
				end
			end

			#puts "#{maxval}"
			#puts "full value: #{fval}"

			solutions.each do |set|
				items = []
				wt = 0
				set.each {|elem| wt += elem.weight; items << elem.name}
				
				#puts "weight: #{wt}"
				#puts "items: #{items.join(',')}"
				
				puts "cena: #{maxval}"
				
				return maxval
			end

		end
		
		fval = 0
		p = 0
		
		while p < instances_count do
			data = IO.readlines(file)[p].split
			items = Array.new;

			id = data[0]; data.shift;
			items_count = data[0].to_i; data.shift;
			knapsack_capacity = data[0].to_i; data.shift;

			i = -1
			j = 0;
			i.upto(items_count-2) do
				items << KnapsackItem.new("#{j}", data[i+1].to_i, data[i+2].to_i)
				i +=2
				j +=1
			end
		
			fval += knap(items, knapsack_capacity)
			p +=1

			#puts fval
		end
	end

	def knapsack_heuristic(file)
		
		instances_count = File.foreach(file).inject(0) {|c, line| c+1}

		fval = 0
		p = 0;
		
		while p < instances_count do
			data = IO.readlines(file)[p].split
			items = Array.new;

			id = data[0]; data.shift; #read instance id
			items_count = data[0].to_i; data.shift; #read instance items
			knapsack_capacity = data[0].to_i; data.shift; #read knapsack capacity	

			i = 0
			x = 0;
			while x < items_count do
				koef = data[i+1].to_i/data[i].to_i
				items << [koef, data[i].to_i, data[i+1].to_i]
				i += 2;
				x += 1;
			end

			total = 0
			mval = 0
			
			items.sort.reverse.each do |item|
				break if (total+item[1] > knapsack_capacity)
				total += item[1]
				mval += item[2]
			end
			
			puts "cena: #{mval}"
			#fval += mval
			p +=1
			#puts fval
		end
	end
end
