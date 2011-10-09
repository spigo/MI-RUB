# read input
# t => the number of graphs <= 100
# 

def readfile (file)
	file = File.open(file + ".txt") 
	t = (file.first).to_i;
	puts "Graphs: " + t.to_s();
	
	lists = Hash.new
	list = Hash.new
	
	$i = 1;
	
	while $i <= t do
		puts("Start read graph #$i");
		#list["#$i"] = Array.new;
		n = (file.first).to_i
		puts list
		$j = 1;
		
		while $j <= n do
			line = file.first
			puts line;
			vertices = line.split;
			
			sublist = Array.new;
			
			vertices.shift
			vertices.shift
			vertices.each_with_index { |i,index|
				sublist[index] = i
			}
			list["#$j"] = sublist
			
			$j +=1;
		end
		
		lists["#i"] = list
		
		begvertex = (file.first).split
		puts begvertex;
		
		$p = 0;
		b = n - begvertex[0].to_i + 2
		while $p < b do
			puts file.first
			$p +=1;
		end
		
		puts "--------------------"
		
		$i +=1;
	end
	
	return list
end	
	
$list = readfile ("input")

def BFS()
  queue = ["1"]
  visited = {"1"=>true}
  puts "\n"
  print "1 "
    while(!queue.empty?)
      node = queue.pop()
      $list[node].each do |child|
        if visited[child] != true then
           print "#{child} "
           queue.unshift(child)
           visited[child] = true
         end
      end
    end
end

BFS();
