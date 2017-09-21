wskazowkaMin = {
  x1 = 400,
  y1 = 300,
  x2 = 0,
  y2 = 0,
  dif = -1
}

function wskazowkaMinDraw()
  love.graphics.line(wskazowkaMin.x1, wskazowkaMin.y1, wskazowkaMin.x2, wskazowkaMin.y2)
end

function wskazowkaMinUpdate(dt)
  wskazowkaMin.x2 = 400 + (math.cos((timeMin*(math.pi/30) - math.pi/2)))*190
  wskazowkaMin.y2 = 300 + (math.sin((timeMin*(math.pi/30) - math.pi/2)))*190
end
