width = love.graphics.getWidth()
height = love.graphics.getHeight()

enemiesCreated = false
canShoot = true
enemyMoveRight = true
fastTextBool = true
gameOver = false
fastTextValue = ""
fastTextTimer = 2
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax
enemyMoveTimer = 0
difficulty = 2
level = 1

enemies = {}
bullets = {}
player = { x1 = 0, y1 = 0, x2 = -15, y2 = 30, x3 = 15, y3 = 30}

function love.load()
    createEnemy()
    fastTextValue = "Level " .. level
end

function love.draw()

    love.graphics.translate(width/2, 500)
    if gameOver == false then
        love.graphics.polygon("fill", player.x1, player.y1, player.x2, player.y2, player.x3, player.y3)
        love.graphics.print("" .. #enemies , -400, -500)
        bulletDraw()
        EnemyDraw()
        if fastTextBool then
            love.graphics.print(""..fastTextValue , -30, -300)
        end
    end

end

function love.update(dt)

    if(love.keyboard.isDown("left")) then
        player.x1 = player.x1 - 250 * dt
        player.x2 = player.x2 - 250 * dt
        player.x3 = player.x3 - 250 * dt
    end
    if(love.keyboard.isDown("right")) then
        player.x1 = player.x1 + 250 * dt
        player.x2 = player.x2 + 250 * dt
        player.x3 = player.x3 + 250 * dt
    end
    if(love.keyboard.isDown("space") and canShoot) then
        createBullet(dt)
    end

    if #enemies == 0 then
        level = level + 1
        createEnemy()
        fastTextTimer = 5
        fastTextBool = true
    end

    fastTextValue = "Level " .. level
    bulletUpdate(dt)
    EnemyUpdate(dt)
    shootAble(dt)
    fastText(dt)
    bulletHit()

end

function fastText(dt) 

    if fastTextBool then
        fastTextTimer = fastTextTimer - dt
        if fastTextTimer < 0 then
            fastTextBool = false
        end 
    end

end
------------------------------------------------------------------------//

function shootAble(dt)
    canShootTimer = canShootTimer - (0.5 * dt)
    if canShootTimer < 0 then
        canShoot = true
    end
end

function createBullet(dt)
    newBullet = {x = player.x1 - 2, y = player.y1}
    table.insert(bullets, newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
end

function bulletDraw()
    for i, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, 2, 9)
    end
end

function bulletUpdate(dt)

    for i, bullet in ipairs(bullets) do

        bullet.y = bullet.y - (250 * dt)

        if bullet.y < -500 then 
            table.remove(bullets, i)
        end
    end
end

------------------------------------------------------------------------//

function createEnemy()

    for i = 0, 2 do
        for j = 0, 6 do
            newEnemy = {x = -200 + j * 70  , y = -490 + i * 50 }
            table.insert(enemies, newEnemy)
        end
    end

end

function EnemyDraw()
    for i, Enemy in ipairs(enemies) do
        love.graphics.rectangle("fill", Enemy.x, Enemy.y, 20, 20)
    end
end

function EnemyUpdate(dt)
    enemyMoveTimer = enemyMoveTimer + dt

    if enemyMoveTimer >= 1 then
        enemyMoveTimer = 0
        for i, Enemy in ipairs(enemies) do
            Enemy.y = Enemy.y + 10
            if enemyMoveRight then
                Enemy.x = Enemy.x + difficulty
            else
                Enemy.x = Enemy.x - 10
            end
        end
    end

    for i, Enemy in ipairs(enemies) do

        if Enemy.x > 300 then
            enemyMoveRight = false
        elseif Enemy.x < -300 then
            enemyMoveRight = true
        end


        if Enemy.y > 500 then 
            table.remove(enemies, i)
            fastTextTimer = 1000000
            fastTextBool = true
            fastTextValue = "GAME OVER"
        end
    end
end

------------------------------------------------------------------------//

function bulletHit() 
    for i, Enemy in ipairs(enemies) do
        for j, bullet in ipairs(bullets) do
            if CheckCollision(Enemy.x, Enemy.y, 20, 20, bullet.x, bullet.y, 4, 10) then
                table.remove(bullets, j)
                table.remove(enemies, i)
            end 
        end
    end
    for i, Enemy in ipairs(enemies) do
        if CheckCollision(Enemy.x, Enemy.y, 25, 25, player.x1, player.y1, 50, 50) then
            alive = false
        end
    end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end

------------------------------------------------------------------------