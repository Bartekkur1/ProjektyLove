local anim8 = require 'anim8'

player = {x = 10, y = 558}
vel = {x = 0, y = 0}
rects = {}
rightDir = true

function love.load()
  --animacje--
  love.window.setTitle("Mario")
  MapBack11 = love.graphics.newImage("Asets/MapBack.png")
  MapFront11 = love.graphics.newImage("Asets/MapFront.png")
  MarioIMG = love.graphics.newImage("Asets/Mario1.png")
  local MarioIMG = anim8.newGrid( 14, 17, 369, 61, 4, 40, 0)
  local MarioIMG2 = anim8.newGrid( 16, 16, 369, 61, 60, 40, 0)
  run = anim8.newAnimation(MarioIMG('2-4',1), 0.1)
  stop  = anim8.newAnimation(MarioIMG('1-1',1), 0.1)
  Jump = anim8.newAnimation(MarioIMG2('2-2',1), 0.1)
  runL = anim8.newAnimation(MarioIMG('2-4',1), 0.1):flipH()
  stopL  = anim8.newAnimation(MarioIMG('1-1',1), 0.1):flipH()
  JumpL = anim8.newAnimation(MarioIMG2('2-2',1), 0.1):flipH()
  Falling = nil
  LastAnima = nil
  MarioAnima = stop
  -- physics --
    -- nope --
end
function love.draw()
  love.graphics.draw(MapBack11,0,378)
  love.graphics.draw(MapFront11,0,378)
  MarioAnima:draw(MarioIMG, player.x, player.y,0)
  love.graphics.print(player.y,0,0)
  -- obiekty na mapie test --
  love.graphics.rectangle("line",256,514,16,16)
  love.graphics.rectangle("line",319,514,80,16)
  love.graphics.rectangle("line",448,546,32,32)
  love.graphics.rectangle("line",351,450,16,16)
end 
function love.update(dt)
  MarioAnima:update(dt)

  player.y = player.y + vel.y
  if player.y >= 559 then
    player.y = 559
    vel.y =  0
  end
  if player.y <= 559 then
    vel.y = vel.y + 10 * dt
  end


  if love.keyboard.isDown("right") then
    MarioAnima = run
    rightDir = true
    player.x = player.x + 1
  end
  if love.keyboard.isDown("left") then
    MarioAnima = runL
    rightDir = false
    player.x = player.x - 1
  end

  if love.keyboard.isDown("space") then
      if rightDir == true then
        vel.y = -3
        MarioAnima = Jump
        MarioAnima:pauseAtEnd()
      end
      if rightDir == false then
        MarioAnima = JumpL
        MarioAnima:pauseAtEnd()
      end
    end

end

function love.keyreleased(key)
  if key == "right" then
    MarioAnima = stop
  end
  if key == "left" then
    MarioAnima = stopL
  end
end
