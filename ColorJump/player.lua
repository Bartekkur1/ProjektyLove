Screen_width = love.graphics.getWidth()
Screen_height = love.graphics.getHeight()

player = {x = Screen_width/2, y = 499, velY = 0, color = {255,255,255}}

function player_Draw()
  love.graphics.setColor(player.color)
  love.graphics.circle("fill", player.x, player.y, 15)
end

function player_Update(dt)
  player.velY = player.velY + 10 * dt
  if player.y < 500 then
    player.y = player.y + player.velY
  end
  if love.keyboard.isDown("space") then
    player.velY = -3
    player.y = player.y + player.velY
  end
end
