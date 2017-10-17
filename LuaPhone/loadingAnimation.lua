
width = love.graphics.getWidth()
height = love.graphics.getHeight()
circles = {}
runing = false

function lA_start()
  runing = true
  if circles[1] == nil then
    generate_lA()
  end
end

function lA_stop()
  runing = false
end

function generate_lA()
  -- 1 2 3 4 5 ... 12
  for i=0,12 do
    newCirc = {x = width/2, y = height/2, dif = (i * math.pi/6)}
    table.insert(circles, newCirc)
  end
end

function draw_lA()
  if runing then
    for i, point in ipairs(circles) do
      love.graphics.setColor(255,255,255)
      love.graphics.points(point.x, point.y)
      randomLine_lA()
    end
  end
end

function update_lA(dt)
  if runing then
    rand = love.math.random(0,10)
    for i, point in ipairs(circles) do
      point.x = width/2 + math.cos(point.dif)*100
      point.y = height/2 + math.sin(point.dif)*100
      point.dif = point.dif + (math.pi/160)
    end
  end
end

function randomLine_lA()
  if runing then
    local rand1 = love.math.random(1,12) -- x1 y2
    local rand2 = love.math.random(1,12) -- x2 y2
    local rand3 = love.math.random(1,100) -- do losowania
    if rand3 == 50 then
      if rand1 ~= rand2 then
        love.graphics.setColor(255,255,255)
        love.graphics.line(circles[rand1].x, circles[rand1].y, circles[rand2].x, circles[rand2].y)
      end
    end
  end
end
