local anim8 = require 'anim8'
require('camera')

player = {x = 10, y = 200}
vel = {x = 0, y = 0, a = 1}
collisionBoxes = {}
rightDir = true
inair = false

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
  collisionBoxes[#collisionBoxes + 1] = {256,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {320,136,80,16}
  collisionBoxes[#collisionBoxes + 1] = {448,168,32,32}
  collisionBoxes[#collisionBoxes + 1] = {351,72,16,16}
  collisionBoxes[#collisionBoxes + 1] = {608,152,32,48}
  collisionBoxes[#collisionBoxes + 1] = {736,134,32,64}
  collisionBoxes[#collisionBoxes + 1] = {912,136,32,64}
  collisionBoxes[#collisionBoxes + 1] = {1232,136,48,16}
  collisionBoxes[#collisionBoxes + 1] = {1280,72,128,16}
  collisionBoxes[#collisionBoxes + 1] = {1456,72,64,16}
  collisionBoxes[#collisionBoxes + 1] = {1504,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1600,136,32,16}   
  collisionBoxes[#collisionBoxes + 1] = {1696,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1744,72,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1744,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1792,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1888,136,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1936,72,48,16}
  collisionBoxes[#collisionBoxes + 1] = {2048,72,64,16}
  collisionBoxes[#collisionBoxes + 1] = {2064,136,32,16}
  collisionBoxes[#collisionBoxes + 1] = {2144,184,16,16}
  collisionBoxes[#collisionBoxes + 1] = {1936,72,16,16}
  collisionBoxes[#collisionBoxes + 1] = {2160,168,16,32}
  collisionBoxes[#collisionBoxes + 1] = {2176,152,16,48}
  collisionBoxes[#collisionBoxes + 1] = {2192,136,16,64}
  collisionBoxes[#collisionBoxes + 1] = {2240,136,16,64}
  collisionBoxes[#collisionBoxes + 1] = {2256,152,16,48}
  collisionBoxes[#collisionBoxes + 1] = {2272,168,16,32}
  collisionBoxes[#collisionBoxes + 1] = {2288,184,16,16}
  collisionBoxes[#collisionBoxes + 1] = {2368,184,16,16}
  collisionBoxes[#collisionBoxes + 1] = {2384,168,16,32}
  collisionBoxes[#collisionBoxes + 1] = {2400,152,16,48}
  collisionBoxes[#collisionBoxes + 1] = {2416,136,32,48}
  collisionBoxes[#collisionBoxes + 1] = {2480,136,16,64}
  collisionBoxes[#collisionBoxes + 1] = {2496,152,16,48}
  collisionBoxes[#collisionBoxes + 1] = {2512,168,16,32}
  collisionBoxes[#collisionBoxes + 1] = {2528,184,16,16}
  collisionBoxes[#collisionBoxes + 1] = {2608,168,32,32}
  collisionBoxes[#collisionBoxes + 1] = {2688,136,64,16}
  collisionBoxes[#collisionBoxes + 1] = {2864,168,32,32} 
  collisionBoxes[#collisionBoxes + 1] = {2896,184,16,16}
  collisionBoxes[#collisionBoxes + 1] = {2912,168,16,32} 
  collisionBoxes[#collisionBoxes + 1] = {2928,152,16,48} 
  collisionBoxes[#collisionBoxes + 1] = {2944,136,16,64} 
  collisionBoxes[#collisionBoxes + 1] = {2960,120,16,80} 
  collisionBoxes[#collisionBoxes + 1] = {2976,104,16,96} 
  collisionBoxes[#collisionBoxes + 1] = {2992,88,16,116} 
  collisionBoxes[#collisionBoxes + 1] = {3008,72,32,128} 
  collisionBoxes[#collisionBoxes + 1] = {2480,200,912,22} 
  collisionBoxes[#collisionBoxes + 1] = {1425,200,1023,22}
  collisionBoxes[#collisionBoxes + 1] = {1136,200,240,22}
  collisionBoxes[#collisionBoxes + 1] = {0,200,1100,22}
  -- physics --
    -- nope --
end

function love.draw()
    camera:set()
    camera:setScale(0.8, 0.8)
  love.graphics.draw(MapBack11,0,0)
  love.graphics.draw(MapFront11,0,0)
  MarioAnima:draw(MarioIMG, player.x, player.y,0)
  --love.graphics.print(vel.a,0,0)
  -- obiekty na mapie test --

    camera:unset()

    if love.keyboard.isDown("right") then
      MarioAnima = run
    elseif love.keyboard.isDown("left") then
      MarioAnima = runL
    end

end 
function love.update(dt)
  MarioAnima:update(dt)

  camera.x = player.x - love.graphics.getWidth()/2 + 200
  camera.y = -100

  if inair and collisionCheckGround() then
    if rightDir then
      MarioAnima = stop
    else
      MarioAnima = stopL
    end
  end

  local x = player.x + vel.x * dt * 10
  local y = player.y + vel.y 
  local w = 16
  local h = 16

  for _, box in pairs(collisionBoxes) do
    local x2 = box[1]
    local y2 = box[2]
    local w2 = box[3]
    local h2 = box[4]
    
    local dLeft = (x + w) - x2
    local dRight = (x2 + w2) - x
    local dTop = (y + h) - y2
    local dBottom = (y2 + h2) - y

    if (x + w >= x2 and x <= x2 + w2 and y + h >= y2 and y <= y2 + h2) then
      if (dTop < dLeft and dTop < dRight and dTop < dBottom) and dTop > 0 then
        y = y - dTop
        break
      end

      if (dBottom < dLeft and dBottom < dRight and dBottom < dTop) and dBottom > 0 then
        y = y + dBottom
        vel.y = -vel.y
        break
      end

      if (dLeft < dBottom and dLeft < dRight and dLeft < dTop) and dLeft > 0 then
        x = x - dLeft
        break
      end

      if (dRight < dLeft and dRight < dTop and dRight < dBottom) and dRight > 0 then
        x = x + dRight
        break
      end
    end
  end

  player.x = x
    player.y = y

  inair = not collisionCheckGround()

  if collisionCheckGround() then
    vel.y =  0
    MarioAnima:resume()
  end

  if collisionCheckGround() == false then
    vel.y = vel.y + 10 * dt
    if rightDir then
      MarioAnima = Jump
      MarioAnima:pauseAtEnd()
    else
      MarioAnima = JumpL
      MarioAnima:pauseAtEnd()
    end

  end

  if love.keyboard.isDown("right") then
      vel.x = 10 * vel.a
      if vel.a <= 3 then
        vel.a = vel.a + 0.01
      end
      rightDir = true
  elseif love.keyboard.isDown("left") then
      vel.x = -10 * vel.a
      if vel.a <= 3 then
        vel.a = vel.a + 0.01
      end
      rightDir = false
  else
    vel.a = 0.5
    vel.x = 0
  end

  if love.keyboard.isDown("space") and collisionCheckGround() then
      vel.y = -5
  end

end

function love.keyreleased(key)
  if key == "left" then
    MarioAnima = stopL
  elseif key == "right" then
    MarioAnima = stop
  end
end

function collideRectRect (x, y, w, h, x2, y2, w2, h2)
    if (x + w >= x2 and x <= x2 + w2 and y + h >= y2 and y <= y2 + h2) then  
        return true
    else
        return false;
    end
end

function collisionCheckGround()
  for _, box in pairs(collisionBoxes) do
    if collideRectRect(player.x,player.y,16,16,box[1] + 4,box[2] - 1,box[3] - 8,box[4] - 2) then
      return true
    end
  end
  return false
end
