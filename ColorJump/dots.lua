dots = {}
Screen_width = love.graphics.getWidth()
Screen_height = love.graphics.getHeight()

function dots_New(height)
  for i=0,10 do
    newDot = {x = 0,
              y = height,
              dif = i,
              color = painters_GetColor(),
              Height = height
  }
    table.insert(dots,newDot)
  end
end

function dots_Draw()
  for i,dot in ipairs(dots) do
    love.graphics.setColor(dot.color)
    love.graphics.circle("fill",dot.x, dot.y, 15)
  end
end

function dots_Update(dt)
  for i,dot in ipairs(dots) do
    dot.x = Screen_width/2 + (math.cos(dot.dif*12))*100
    dot.y = dot.Height + (math.sin(dot.dif*12))*100
    dot.dif = dot.dif + math.pi/2000
    if math.dist(player.x, player.y, dot.x, dot.y) < 7 and player.color ~= dot.color then
      gameOver = true
    end
  end
end
