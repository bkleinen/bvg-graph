class Graph
  def initialize
    @adjacencies = Hash.new { |hash, key| hash[key] = Hash.new }
    @node_names = Hash.new
    @node_ids = Hash.new { |hash, key| hash[key] = [] }
  end
  def add_edge(from_id,from_name,to_id,to_name,weight)
    @adjacencies[from_name][to_name] = weight.to_s
    @adjacencies[to_name][from_name] = weight.to_s
    @node_names[from_id] = from_name
    @node_names[to_id] = to_name
    @node_ids[from_name] << from_id
    @node_ids[to_name] << to_id
  end
  def node_id(name)
    @node_ids[name].first
  end
  def outgoing_edges(from)
    @adjacencies[from]
  end
  def node_name(node)
    @node_names[node]
  end
  def node_ids
    @node_ids.keys
  end
  def node_names
    @adjacencies.keys
  end
  def to_s
    node_names.map{|n| "#{node_id(n)}, #{(@adjacencies[n].to_a.map{|x| "#{node_id(x[0])},#{x[1]}"}).join(" ")}"}.join("\n")
  end
  def nodes_names_to_s
    node_names.map{|n| "#{node_id(n)},  #{n}"}.join("\n")
  end
  def stations
    node_names.map{|n| "#{n}, #{node_id(n)}"}.join("\n")
  end
end
