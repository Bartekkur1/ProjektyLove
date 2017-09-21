wskazowkaSec = {
  x1 = 400,
  y1 = 300,
  x2 = 0,
  y2 = 0,
  dif = -1
}

function wskazowkaSecDraw()
  love.graphics.line(wskazowkaSec.x1, wskazowkaSec.y1, wskazowkaSec.x2, wskazowkaSec.y2)
end

function wskazowkaSecUpdate()
  wskazowkaSec.x2 = 400 + (math.cos(wskazowkaSec.dif*(math.pi/2)))*245
  wskazowkaSec.y2 = 300 + (math.sin(wskazowkaSec.dif*(math.pi/2)))*245
end
