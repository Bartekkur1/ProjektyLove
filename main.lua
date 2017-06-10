player = {x = 40, y = 40, vX = 1, vY = 0, col = 0}
food = {x = 0, y = 0, isSpawned = false, eaten = false}
timer = 0
tick = false
size = 20
total = 0
lastPos = {}
aiSameY = false

function love.draw()
    love.graphics.rectangle("fill",player.x, player.y,size,size)

    for i, part in ipairs(lastPos) do
        love.graphics.rectangle("fill",part.x, part.y,size,size)
    end
    drawFood()
end

function love.update(dt)

    foodEaten()
    timerUpdate(dt)
    playerControlls()
    aiControl()

    if checkCollision() then
        food.isSpawned = false
    end

    if tick then
        for i = 1, total-1 do
            lastPos[i] = lastPos[i+1]
        end
        lastPos[total] = {x = player.x, y = player.y}
        player.x = player.x + player.vX * size
        player.y = player.y + player.vY * size
    end

    if food.isSpawned == false then
        spawnFood()
    end
end

function timerUpdate(dt)
    if timer > 0.01 then
        tick = true
        timer = 0
    else 
        timer = timer + dt
        tick = false
    end
end

function playerControlls()
    if love.keyboard.isDown("left") and player.vX ~= 1 then
        player.vX = -1
        player.vY = 0
    elseif love.keyboard.isDown("right") and player.vX ~= -1 then
        player.vX = 1
        player.vY = 0
    elseif love.keyboard.isDown("up") and player.vY ~= 1 then
        player.vY = -1
        player.vX = 0
    elseif love.keyboard.isDown("down") and player.vY ~= -1 then
        player.vY = 1
        player.vX = 0
    end
end

function checkCollision()
    if player.x == food.x and player.y == food.y then
        return true
    end
end

function spawnFood()
    food.isSpawned = true
    food.x = love.math.random(0,19) * size
    food.y = love.math.random(0,9) * size
end

function foodEaten()
    if checkCollision() then
        local rand = 20
        total = total + 1
        newPart = {x = player.x, y = player.y}
        table.insert(lastPos,newPart)
    end
end

function drawFood()
    love.graphics.rectangle("fill", food.x, food.y, size, size)
end

function aiControl()

    if player.y == food.y then
        aiSameY = true
    else
        aiSameY = false
    end

    if aiSameY == false then
        if player.y > food.y then
            player.vY = -1
            player.vX = 0
        elseif player.y < food.y then
            player.vY = 1
            player.vX = 0
        end
    else 
        if player.x > food.x then
            player.vY = 0
            player.vX = -1
        elseif player.x < food.x then
            player.vY = 0
            player.vX = 1
        end     
    end


end