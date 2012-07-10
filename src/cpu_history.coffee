
DATA_SIZE_LIMIT = 10000

return if @g_cpu_history

data = []
step = 50
d    = null

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
  return if data.length > DATA_SIZE_LIMIT
  data.push percent

init = ->
  d = new Date()
  setTimeout cal_cpu, step

@g_cpu_history = {init, data}
