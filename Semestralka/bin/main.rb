require '../lib/Knapsack'

begin
	puts "Zvolte metodu pro vypocet"
	puts "1. pro vypocet hrubou silou"
	puts "2. pro vypocet heuristickou metodou"
	
	value = Float(gets)
	
	if (value < 1 || value > 2)
		raise "Spatny vstup."
	end
	
	Knapsack = Knapsack.new
		
	case value
	when 1
    	Knapsack.knapsack_bruteforce("../test/knap_4.inst.dat");
    when 2
		Knapsack.knapsack_heuristic("../test/knap_4.inst.dat");
	end
	
rescue Exception => e  
	
	puts e.message

rescue ArgumentError => e
		
	puts "Spatny vstup."

end
