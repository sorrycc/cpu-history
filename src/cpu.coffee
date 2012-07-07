
return if !@cpu_Coordinate || !@cpu_Collector

@cpu_Collector.init()
@cpu_Coordinate.init()

setInterval ->
  @cpu_Coordinate.draw_data @cpu_Collector.data
, 100
