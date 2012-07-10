
return if !@g_cpu_history

# 打点服务器.
BACON_SERVER = 'http://www.atpanel.com/ued.1.1.2?type=9&id=cpuhistory'
# 默认打点比率是 1/300.
DEFAULT_BACON_RATE = 300
# 打点时间点.
BACON_TIME_POINT = 20000

# 调试模式.
debug_mode = false


#########################
# Utils.

bacon_count = 0
bacon = ->
  # 调试模式下不判断打点比率.
  unless debug_mode
    return if (parseInt Math.random() * DEFAULT_BACON_RATE) != 0
  data = @g_cpu_history.data
  # 只打点一次
  return if bacon_count > 0
  return if !data || !data.length
  bacon_el = @["g_cpuhistory_#{bacon_count++}"] = new Image()
  data = (filter_data data).join ','
  # alert "#{get_base_url()}&data=#{data}"
  bacon_el.src = "#{get_base_url()}&data=#{data}"

filter_data = (data) ->
  count_100 = 0
  count_50  = 0
  count_20  = 0
  count_0  = 0
  for item in data
    if item == 100
      count_100++
    else if item >= 50
      count_50++
    else if item >= 20
      count_20++
    else
      count_0++
  [count_100, count_50, count_20, count_0]

get_base_url = ->
  # apikey 先写死.
  "#{BACON_SERVER}&t=#{+new Date()}&apikey=fp2012"


#########################
# Run.
@g_cpu_history.init?()

old_unload_handler = @onunload
@onunload = ->
  old_unload_handler?()
  bacon()
# old_beforeunload_handler = @onbeforeunload
# @onbeforeunload = ->
#   old_beforeunload_handler?()
#   bacon()
setTimeout bacon, BACON_TIME_POINT

if (location.href.indexOf '__cpuhistory__') > -1
  debug_mode = true

# Note
# 1. Chrome 下，在 beforeunload 之前发 new Image() 请求，会弹出提示
