local anim8 = require 'anim8'
require 'camera'

flip = false
player = {x = 0, y =  0}
vely = 0
function love.load()
  local characters = anim8.newGrid( 32, 33, 736, 128, 0, 0, 0)
  local map = anim8.newGrid(70, 120, 250, 120, 30)
  local Ground = anim8.newGrid(43, 15, 250, 120, 103)
  playerTextures = love.graphics.newImage('characters.png')
  mapTextures = love.graphics.newImage('map.png')
  mapTree = anim8.newAnimation(map('1-1',1), 0.1)
  mapGround = anim8.newAnimation(Ground('1-1',1), 0.1)
  runLeft = anim8.newAnimation(characters('15-18',2), 0.1):flipH()
  runRight = anim8.newAnimation(characters('15-18',2), 0.1)
  jumpPrep = anim8.newAnimation(characters('5-5',2), 0.1)
  jumpUp = anim8.newAnimation(characters('6-6',2), 0.1)
  jumpDown = anim8.newAnimation(characters('7-7',2), 0.1)
  jumpLand = anim8.newAnimation(characters('8-8',2), 0.1)
  standRight = anim8.newAnimation(characters('1-1',2), 0.1)
  standLeft = anim8.newAnimation(characters('1-1',2), 0.1):flipH()
  playerAnima = standRight
end
function love.draw()
  camera:set()
  mapTree:draw(mapTextures,love.graphics.getWidth()/2 - 200 ,0,0,5,5)
  for i=800,0,-100 do
  mapGround:draw(mapTextures, i, love.graphics.getHeight()-40, 0, 3, 3)
  end
  playerAnima:draw(playerTextures, player.x, player.y, 0, 2.5, 2.5)
  camera:unset()
end 
function love.update(dt)
  playerAnima:update(dt)
  player.y = player.y + vely
  if player.y <= love.graphics.getHeight()-120 then
    vely = 5
  end
  if player.y >= love.graphics.getHeight()-120 then
    player.y = love.graphics.getHeight()-120
  end
   if love.keyboard.isDown('left') then
      playerAnima = runLeft
      player.x =  player.x - 3
   end
   if love.keyboard.isDown('right') then
      playerAnima = runRight
      player.x =  player.x + 3
   end
end
function love.keyreleased(key)
   if key == "left" then
      playerAnima = standLeft
   end
   if key == "right" then
      playerAnima = standRight
   end
end


