player = {x = 0, y = 0}
vely = 0
gravity = 10
translate = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight()/2}
rotation = 0
skok = false

require('camera')


function love.draw()
    love.graphics.translate(translate.x,translate.y)
    love.graphics.rotate(rotation)
    love.graphics.circle("fill", player.x, 0, 20)
    love.graphics.line(0,0,0,30)
    love.graphics.origin()
    love.graphics.rectangle("fill",0,590,800,10)
    love.graphics.print(""..(globalDt or 0),0,0)
end
function love.update(dt)
    globalDt = dt

    translate.y = translate.y - vely

    if love.keyboard.isDown("left") then
        translate.x = translate.x - 0.5
        rotation = rotation - 0.5
    end
    if love.keyboard.isDown("right") then
        translate.x = translate.x + 0.5
        rotation = rotation + 0.5
    end
    if translate.y >= 570 then
        translate.y = 570
        vely = 0
        skok = true
    end
    if translate.y <= 570 then
        vely = vely - gravity * dt
    end
    if (love.keyboard.isDown("space") and skok == true) then
        vely = 10
        skok = false
    end
end