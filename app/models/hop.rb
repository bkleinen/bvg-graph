class Hop
  attr_accessor :from, :to, :time
  def self.hops_from_trip(trip)
    st = trip.stop_times
    hops = []
    for i in 0..(st.size-2) do
      from = st[i].stop_identifier
      to = st[i+1].stop_identifier
      time = st[i+1].arrival_time - st[i].departure_time
      hops << Hop.new(from, to, time)
    end
   hops
  end
  def initialize(from_si,to_si,time)
    @from = Stop.where(stop_identifier: from_si).first
    @to = Stop.where(stop_identifier: to_si).first
    @time = time
  end
end
