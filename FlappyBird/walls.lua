walls = {}

function walls:New()
  newWall = {
    x = 800,
    y = walls:GetRandomWidth(),
    height = 600,
    width = 30,
    hole = math.random(1,4),
    next = false
  }
  table.insert(walls,newWall)
end

function walls:Update(dt)
  for i, wall in ipairs(walls) do
    wall.x = wall.x - 135 * dt

    if collideRect(wall.x, wall.y, wall.width, wall.height, player.x, player.y, player.size, player.size) then
      gameOver = true
    end
    if collideRect(wall.x, wall.y + 730, wall.width, wall.height, player.x, player.y, player.size, player.size) then
      gameOver = true
    end

    if wall.x < 600 then
      if wall.next == false then
        walls:New()
         wall.next = true
      end
    end
    if wall.x < -wall.width then
      table.remove(walls, i)
    end
  end
end

function walls:Draw()
  for i, wall in ipairs(walls) do
    love.graphics.rectangle("fill", wall.x, wall.y, wall.width, wall.height)
    love.graphics.rectangle("fill", wall.x, wall.y + 730, wall.width, wall.height)
  end
end

function walls:GetRandomWidth()
  local rand = math.random(1,4)
  if rand == 1 then
    return -300
  elseif rand == 2 then
    return -340
  elseif rand == 3 then
    return -380
  elseif rand == 4 then
    return -420
  end
end

function collideRect(x, y, w, h, x2, y2, w2, h2)
  if (x + w >= x2 and x <= x2 + w2 and y + h >= y2 and y <= y2 + h2) then
    return true;
  else
    return false;
  end
end
