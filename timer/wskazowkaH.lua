wskazowkaH = {
  x1 = 400,
  y1 = 300,
  x2 = 0,
  y2 = 0,
  dif = -1
}

function wskazowkaHDraw()
  love.graphics.line(wskazowkaH.x1, wskazowkaH.y1, wskazowkaH.x2, wskazowkaH.y2)
end

function wskazowkaHUpdate(dt)
  wskazowkaH.x2 = 400 + (math.cos((wskazowkaH.dif*(math.pi/2)) + (timeH*(math.pi/6))))*130
  wskazowkaH.y2 = 300 + (math.sin((wskazowkaH.dif*(math.pi/2)) + (timeH*(math.pi/6))))*130
end
