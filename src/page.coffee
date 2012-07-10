
return if !@g_cpu_history

BACON_SERVER = 'http://www.atpanel.com/ued.1.1.2?type=9&id=cpuhistory'

bacon_count = 0
bacon = ->
  data = @g_cpu_history.data
  # 只打点一次
  return if bacon_count > 0
  return if !data || !data.length
  bacon_el = @["g_cpuhistory_#{bacon_count++}"] = new Image()
  data = (filter_data data).join ','
  alert "#{get_base_url()}&data=#{data}"
  # bacon_el.src = "#{get_base_url()}&data=#{data}"

filter_data = (data) ->
  count_100 = 0
  count_50  = 0
  for item in data
    if item == 100
      count_100++
    else if item >= 50
      count_50++
  [count_100, count_50]

get_base_url = ->
  "#{BACON_SERVER}&t=#{+new Date()}"

@g_cpu_history.init?()

old_unload_handler = @onunload
@onunload = ->
  old_unload_handler?()
  bacon()
# old_beforeunload_handler = @onbeforeunload
# @onbeforeunload = ->
#   old_beforeunload_handler?()
#   bacon()
setTimeout bacon, 5000

# Note
# 1. Chrome 下，在 beforeunload 之前发 new Image() 请求，会弹出提示
