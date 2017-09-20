require 'player'
require 'walls'
gameOver = false

function love.load()
  walls:New()
end

function love.draw()
  if gameOver == false then
  player:Draw()
  walls:Draw()
  else
    love.graphics.print("Game Over",360,300)
  end
end

function love.update(dt)
  if gameOver == false then
    player:Update(dt)
    walls:Update(dt)
  end
end
