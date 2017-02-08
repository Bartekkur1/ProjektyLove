player1y = love.graphics.getHeight() / 2 - 90
player2y = love.graphics.getHeight() / 2 - 90
player1x = 20
player2x = 750
ballx = love.graphics.getWidth() / 2
bally = love.graphics.getHeight() / 2
velx = 0
vely = 0
random = 0
player1points = 0
player2points = 0

function love.load()
    ballStart()
end
function love.draw() 
    love.graphics.rectangle("fill", player1x, player1y, 30, 180)
    love.graphics.rectangle("fill", player2x, player2y, 30, 180)
    love.graphics.line(love.graphics.getWidth() / 2, 0,love.graphics.getWidth() / 2, 800)
    love.graphics.circle("fill", ballx, bally, 20) 
    love.graphics.print("Player1 points : "  .. player1points, 10, 0)
    love.graphics.print("Player2 points : "  .. player2points, love.graphics.getWidth() - 120, 0) 
end

function love.update()
    movement()
    collision()
    ballx = ballx + velx
    bally = bally + vely

end
function ballStart()
    --love.timer.sleep(1)
    ballx = love.graphics.getWidth() / 2
    bally = love.graphics.getHeight() / 2
    player1y = love.graphics.getHeight() / 2 - 90
    player2y = love.graphics.getHeight() / 2 - 90
    vely = 0
    random = love.math.random(0,1)
    if random == 1 then
        velx = 8
    else
        velx = -8
    end
end
function movement()
    if love.keyboard.isDown("w") and player1y >= 0 then
        player1y = player1y - 5
    end
    if love.keyboard.isDown("s") and player1y <= 400 then
        player1y = player1y + 5
    end
    if love.keyboard.isDown("up") and player2y >= 0 then
        player2y = player2y - 5
    end
    if love.keyboard.isDown("down") and player2y <= 400 then
        player2y = player2y + 5
    end
end
function collision()
    if ballx <= 0 then
        ballStart()
        player2points = player2points + 1
    end
    if ballx >= love.graphics.getWidth() then
        ballStart()
        player1points = player1points + 1
    end
    if bally <= 0 then
        vely = 5
    end
    if bally >= love.graphics.getHeight() then
        vely = -5
    end
    -- first 0 - 60
    if CollideRectCircle(player1x, player1y, 30, 60, ballx, bally, 20) then
        velx = 8
        vely = -5
    end
    if CollideRectCircle(player2x, player2y, 30, 60, ballx, bally, 20) then
        velx = -8
        vely = -5
    end
    -- second 60 - 120
    if CollideRectCircle(player1x, player1y + 60, 30, 60, ballx, bally, 20) then
        velx = 10
        vely = 0
    end
    if CollideRectCircle(player2x, player2y + 60, 30, 60, ballx, bally, 20) then
        velx = -10
        vely = 0
    end
    -- second 120 - 180
    if CollideRectCircle(player1x, player1y + 120, 30, 60, ballx, bally, 20) then
        velx = 8
        vely = 5
    end
    if CollideRectCircle(player2x, player2y + 120, 30, 60, ballx, bally, 20) then
        velx = -8
        vely = 5
    end
end
function CollideRectCircle(rx, ry, rw, rh, cx, cy, diameter)
    testX = cx;
    testY = cy;
    if cx < rx then    
        testX = rx
    else if cx > rx+rw then
        testX = rx+rw
    end
    if cy < ry then    
        testY = ry
    end
    if cy > ry+rh then
        testY = ry+rh
    end
        distance = math.dist(cx,cy,testX,testY)
    if distance <= diameter/2 then
        return true;
    end
        return false;
    end
end
function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
