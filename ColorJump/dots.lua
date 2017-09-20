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
    dot.x = Screen_width/2 + (math.cos(dot.dif*12))*80
    dot.y = dot.Height + (math.sin(dot.dif*12))*80
    dot.dif = dot.dif + math.pi/2000
  end
end

function dots_Collision(dt)
  for i,dot in ipairs(dots) do
    if math.dist(player.x, player.y, dot.x, dot.y) < 100 then
      if collideCirc(player.x, player.y, 15, dot.x, dot.y, 20) then
        if deepcompare(dot.color,player.color) then
        else
          gameOver = true
          kolor = dot.color
        end
      end
    end
  end
end

function collideCirc(x, y,d, x2, y2, d2)
  if math.dist(x,y,x2,y2) <= (d/2)+(d2/2) then
    return true;
 else
    return false;
  end
end

function deepcompare(t1,t2,ignore_mt)
  local ty1 = type(t1)
  local ty2 = type(t2)
    if ty1 ~= ty2 then
      return false
    end
    if ty1 ~= 'table' and ty2 ~= 'table' then
      return t1 == t2
    end
      local mt = getmetatable(t1)
    if not ignore_mt and mt and mt.__eq then
      return t1 == t2
    end
    for k1,v1 in pairs(t1) do
      local v2 = t2[k1]
      if v2 == nil or not deepcompare(v1,v2) then
        return false
      end
    end
  for k2,v2 in pairs(t2) do
    local v1 = t1[k2]
      if v1 == nil or not deepcompare(v1,v2) then return false end
    end
  return true
end
