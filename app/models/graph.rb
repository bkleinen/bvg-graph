class Graph
  def initialize
    @adjacencies = Hash.new { |hash, key| hash[key] = Hash.new }
    @node_names = Hash.new
  end
  def add_edge(from_id,from_name,to_id,to_name,weight)
    @adjacencies[from_id][to_id] = weight.to_s
    @adjacencies[to_id][from_id] = weight.to_s
    @node_names[from_id] = from_name
    @node_names[to_id] = to_name
  end
  def outgoing_edges(from)
    @adjacencies[from]
  end
  def node_name(node)
    @node_names[node]
  end
  def nodes
    @adjacencies.keys
  end
  def to_s
    nodes.map{|n| "#{n}, #{(@adjacencies[n].to_a.map{|x|x.join(',')}).join(" ")}"}.join("\n")
  end
  def nodes_names_to_s
    nodes.map{|n| "#{n}, #{node_name(n)}"}.join("\n")
  end
  def stations
    nodes.map{|n| "#{node_name(n)}, #{n}"}.join("\n")
  end
end
