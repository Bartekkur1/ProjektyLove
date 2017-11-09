player = {x = 250, y = 720, row = 2, score = 0}
desired = {x = 250, y = 600}


function player_Reset()
    player.x = 250
    player.y = 720
    player.row = 2
    player.score = 0
end

function player_Draw()
    love.graphics.circle("fill", player.x, player.y, 45)
    love.graphics.print(player.score,0,0)
end

function player_Update(dt)
    desired.x = 50 + player.row * 100

    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    if math.dist(player.x, player.y, desired.x, desired.y) > 1 then
        player.x = player.x + (desired.x - player.x)/10
    end

    for i, asteroid in ipairs(asteroids) do
        if math.dist(player.x, player.y, asteroid.x, asteroid.y) < 70 then
            game_runing = false
        end
    end
end

function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end

function love.keyreleased(key)
    if key == "escape" then
        asteroid_Reset()
        player_Reset()
        timer_Reset()
       game_runing = true
    end
end

function love.mousereleased(x, y, button)
    if button == 2 and player.row > 0 then
        player.row = player.row - 1
    end
    if button == 1 and player.row < 4 then
        player.row = player.row + 1
    end
 end