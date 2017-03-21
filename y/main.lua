player1 = {x = 350, y = 250}
player2 = {x = 450, y = 350}

function love.draw()
    -- draw graczy
    love.graphics.circle("fill", player1.x, player1.y, 20)
    love.graphics.circle("fill", player2.x, player2.y, 20)
end

function love.update(dt)
    -- sterowanie
    if love.keyboard.isDown("left") then
        player1.x = player1.x - 4
    end
    if love.keyboard.isDown("right") then
        player1.x = player1.x + 4
    end
    if love.keyboard.isDown("up") then
        player1.y = player1.y - 4
    end
    if love.keyboard.isDown("down") then
        player1.y = player1.y + 4
    end
end
