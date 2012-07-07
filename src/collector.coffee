
data = []
step  = 50
d     = null

cal_cpu = ->
  d2 = new Date()
  diff = d2 - d - step
  # 100% 的情况
  add_100 Math.floor diff/step
  add_percent Math.floor diff % step / step * 100
  init()

add_100 = (count) ->
  while (count-- > 0)
    add_percent 100

add_percent = (percent) ->
  data.push percent
  # console?.log? percent

init = ->
  d = new Date()
  setTimeout cal_cpu, step

@cpu_Collector = {init, data}
