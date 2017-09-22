require 'wskazowkaSec'
require 'wskazowkaMin'
require 'wskazowkaH'

kreski = {}
wskazowkaSec = {
  x1 = 400,
  y1 = 300,
  x2 = 0,
  y2 = 0,
  dif = -1
}
timeSec = 0
timeMin = 32
timeH = 1
sekunda = 0

function generateKreski()
  for i = 0, 11 do
    newKreska = {
      x1 = 0,
      y1 = 0,
      x2 = 0,
      y2 = 0,
      dif = i
    }
    table.insert(kreski, newKreska)
  end
end

function kreskiSet()
  for i, kreska in ipairs(kreski) do
    kreska.x1 = 400 + (math.cos(kreska.dif*(math.pi/6)))*250
    kreska.x2 = 400 + (math.cos(kreska.dif*(math.pi/6)))*270

    kreska.y1 = 300 + (math.sin(kreska.dif*(math.pi/6)))*250
    kreska.y2 = 300 + (math.sin(kreska.dif*(math.pi/6)))*270

    -- pi/6 = 30*
  end
end

function kreskiDraw()
  for i, kreska in ipairs(kreski) do
    -- love.graphics.points(kreska.x1, kreska.y1)
    -- love.graphics.points(kreska.x2, kreska.y2)
    love.graphics.line(kreska.x1, kreska.y1, kreska.x2, kreska.y2)
  end
    love.graphics.circle("line", 400, 300, 280)
end

function love.load()
  generateKreski()
  kreskiSet()
end

function love.draw()
  kreskiDraw()
  wskazowkaSecDraw()
  wskazowkaMinDraw()
  wskazowkaHDraw()
  love.graphics.print(timeSec,wskazowkaSec.x2,wskazowkaSec.y2)
  love.graphics.print(timeMin,wskazowkaMin.x2,wskazowkaMin.y2)
  love.graphics.print(timeH,wskazowkaH.x2,wskazowkaH.y2)
end

function love.update(dt)
  wskazowkaSecUpdate(dt)
  wskazowkaMinUpdate(dt)
  wskazowkaHUpdate(dt)
  wskazowkaSec.dif = 3 + (timeSec/15)

  -- wskazowkaMin.dif = -1 + (wskazowkaSec.dif/60)
  --
  -- wskazowkaH.dif = -1 + (wskazowkaMin.dif/60)

  sekunda = sekunda + dt
  if sekunda > 1 then
    sekunda = 0
    timeSec = timeSec + 1
  end

  --timeSec = timeSec + dt
  if timeSec > 60 then
    timeMin = timeMin + 1
    timeSec = 0
  end
  if timeMin > 60 then
    timeH = timeH + 1
    timeMin = 0
  end
end
