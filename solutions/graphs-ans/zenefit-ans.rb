def topological_sort(vertices)
  in_edge_counts = {}
  queue = []
	vertices.each do |v|
		in_edge_counts[v[0]] = 0;
		in_edge_counts[v[1]] = 0;
	end


  vertices.each do |v|
    in_edge_counts[v[1]] += 1
  end
# optimize this
	in_edge_counts.each do |key, val|
		queue << key if val == 0
	end

  sorted_vertices = []

  until queue.empty?
  puts "just ran"
    vertex = queue.shift
    sorted_vertices << vertex
    puts vertex
    puts sorted_vertices
    puts in_edge_counts

	vertices.each do |v|
		if v[0] == vertex
			in_edge_counts[v[1]] -= 1
			if 	in_edge_counts[v[1]] == 0
				queue << v[1]
			end
		end
	end
	puts (in_edge_counts)
end

  sorted_vertices
end

topological_sort([[2,1], [3,1], [4,1], [3,2], [4,2], [4,3],[5,3], [5,4] ])
