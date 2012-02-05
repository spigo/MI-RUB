def count_knapsack(file)
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
#		fval += mval
		p +=1
#		puts fval
	end
end

count_knapsack("../test/knap_4.inst.dat");
