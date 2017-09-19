painters = {}
random = love.math.random(0,100)
color = 0

function painters_GetColor()
  random = math.random(1,3)
  if random == 1 then
    return {255,0,0}
  elseif random == 2 then
    return {0,255,0}
  elseif random == 3 then
    return {0,0,255}
  end
end

function painters_New(height)
  newPainter = {
    x = 400,
    y = height,
    color = painters_GetColor()
  }
  checkers_New(height)
  table.insert(painters,newPainter)
end

function painters_Draw()
  for i, painter in ipairs(painters) do
    love.graphics.setColor(painter.color)
    love.graphics.circle("fill", painter.x, painter.y, 15)
  end
end

function painters_Update(dt)
  for i,painter in ipairs(painters) do
    if math.dist(player.x, player.y, painter.x, painter.y) < 15 then
      player.color = painter.color
    end
  end

  if(painters[#painters].color == painters[#painters-1].color) then
    painter[#painters].color = painters_GetColor()
  end
end


function math.dist(x1,y1, x2,y2)
  return ((x2-x1)^2+(y2-y1)^2)^0.5
end
