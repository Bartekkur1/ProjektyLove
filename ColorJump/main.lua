require 'player'
require 'dots'
require 'painter'
require 'camera'
require 'checker'

gameOver = false
Screen_width = love.graphics.getWidth()
Screen_height = love.graphics.getHeight()
levelY = 200
points = 0

function love.load()
  painters_New(400)
  lvl_up()
end

function love.draw()
  if gameOver == false then
    camera:set()
      player_Draw()
      dots_Draw()
      painters_Draw()
    camera:unset()
    love.graphics.setColor(255,255,255)
    love.graphics.print(points,0,0,0,2,2)
  else
    love.graphics.setColor(255,255,255)
    love.graphics.print("GAME OVER",250,Screen_height/2,0,2,2)
    love.graphics.print("press 'esc' to restart",250,Screen_height/1.5,0,2,2)
  end
end

function love.update(dt)
  if gameOver == false then
    checkers_Update()
    player_Update(dt)
    dots_Update(dt)
    painters_Update(dt)
    camera.x = player.x - Screen_width/2
    camera.y = player.y - Screen_height/2
  else
    if love.keyboard.isDown("escape") then
      player.x = Screen_width/2
      player.y = 499
      player.color = {255,255,255}
      gameOver = false
    end
  end
end

function lvl_up()
  dots_New(levelY)
  painters_New(levelY)
  painters_New(levelY - 200)
  levelY = levelY - 400
end
