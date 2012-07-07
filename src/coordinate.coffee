
paper = null
spv   = stage_padding_vert  = 10
sph   = stage_padding_horiz = 30
sw    = stage_width  = 575
sh    = stage_height = 100
pp    = path_padding = 10
ps    = path_step = 5
p     = null # path
limit = 100

draw_paper = ->
  paper = Raphael(10, 10, stage_width, stage_height)

draw_xy = ->
  paper.rect(10, 10, sw, sh).attr
    'fill': '#333'
  paper.path().attr
    'path'  : "M#{sph} #{spv}L#{sph} #{sh-spv}L#{sw-sph} #{sh-spv}"
    'stroke': 'white'
    'stroke-width': 2

draw_data = (data) ->
  # t = new Date()
  p or= paper.path()
  p.attr
    'path': build_path_str data
    'stroke': 'green'
    'stroke-width': 2
    'stroke-linejoin': 'round'
  # console?.log? "#{new Date() - t}"

build_path_str = (data) ->
  ret = ""
  if data.length > limit
    data = data.slice(data.length - limit)
  for item, index in data
    ret += "L#{sph+pp+ps*index} #{spv+pp+(100-item)/100*(sh-spv*2-pp*2)}"
  ret.replace 'L', 'M'

init = (data) ->
  draw_paper()
  draw_xy()

@cpu_Coordinate = {init, draw_data}
