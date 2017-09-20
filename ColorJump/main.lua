require 'player'
require 'dots'
require 'painter'
require 'camera'
require 'checker'

mainFont = love.graphics.newFont("Simon-Regular.otf", 20)
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
  love.graphics.setFont(mainFont)
  if gameOver == false then
    camera:set()
      player_Draw()
      dots_Draw()
      painters_Draw()
    camera:unset()
    love.graphics.setColor(255,255,255)
    love.graphics.print("points : "..points,0,0)
  else
    love.graphics.setColor(255,255,255)
    love.graphics.print("GAME OVER",270,270)
    love.graphics.print("press 'esc' to restart",270,320)
    love.graphics.print("points : " .. points, 270, 350)
  end
end

function love.update(dt)
  if gameOver == false then
    checkers_Update()
    player_Update(dt)
    dots_Update(dt)
    painters_Update(dt)
    dots_Collision(dt)
    camera.x = player.x - Screen_width/2
    camera.y = player.y - Screen_height/2
  else
    if love.keyboard.isDown("escape") then
      player.x = Screen_width/2
      player.y = 499
      points = 0
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
