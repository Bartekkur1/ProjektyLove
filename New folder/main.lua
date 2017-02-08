player = { x = love.graphics.getWidth()/2, y = 0}
vel = {x = 0, y = 0}
gravity = 25
skok = false
spada = true

require('camera')

function love.draw()
  camera:set()
    love.graphics.setColor( 0, 125, 125)
    love.graphics.rectangle("fill",player.x,player.y,40,40)
    love.graphics.setColor( 0, 0, 255)
    love.graphics.rectangle("fill", 0,450,150,20)
    love.graphics.rectangle("fill", love.graphics.getWidth()/2,300,150,20)
    love.graphics.line(0,love.graphics.getHeight(),love.graphics.getWidth(),love.graphics.getHeight())
  camera:unset()
end
function love.update(dt)
    camera.x = player.x - love.graphics.getWidth()/2
    camera.y = player.y - love.graphics.getHeight()/2

        player.y = player.y + vel.y

        if (player.y >= love.graphics.getHeight()) then
            player.y = love.graphics.getHeight()
        end
        
        if (player.y >= love.graphics.getHeight() - 50 
        or collideRectRect(player.x,player.y,40,40,0,445,150,20)
        or collideRectRect(player.x,player.y,40,40,love.graphics.getWidth()/2,295,150,20)
        ) then
            vel.y = 0
            spada = false
            skok = true
            jumpPower = 0
        else
            spada = true
        end

        if (spada) then
            vel.y = vel.y + gravity * dt
        end

        if (love.keyboard.isDown("up") and skok) then
            vel.y = -15
            skok = false
        end
        if (love.keyboard.isDown("left")) then
            player.x = player.x - 5
        end
        if (love.keyboard.isDown("right")) then
            player.x = player.x + 5
        end
        if (love.keyboard.isDown("o")) then
            camera.scaleX = camera.scaleX + 0.1
            camera.scaleY = camera.scaleY + 0.1
        end
        if (love.keyboard.isDown("p")) then
            camera.scaleX = camera.scaleX - 0.1
            camera.scaleY = camera.scaleY - 0.1
        end
end
function collideRectRect (x, y, w, h, x2, y2, w2, h2)
    if (x + w >= x2 and x <= x2 + w2 and y + h >= y2 and y <= y2 + h2) then  
        return true
    else
        return false;
    end
end