local anim8 = require 'anim8'

width = love.graphics.getWidth()
height = love.graphics.getHeight()
player = {x = width/2, y = 450}
bullets = {}
Enemys = {}
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax
spawnTimer = 0
score = 0
difficulty = 1
alive = true

function love.load()
    playerIMG = love.graphics.newImage("player.png")
    asteroid1 = love.graphics.newImage("asteroida1.png")
    asteroid2 = love.graphics.newImage("asteroida1.png")
    asteroid3 = love.graphics.newImage("asteroida3.png")
end

function love.draw()
    if(alive) then
        love.graphics.print(score,0,0)
        love.graphics.draw(playerIMG, player.x, player.y)
        bulletDraw()
        EnemyDraw()
    else
        love.graphics.print("you died! - score : ".. score, width/2 - 40, height/2 - 10)
        love.graphics.print("press 'R' to reset ", width/2 - 40, height/2)  
    end
end

function love.update(dt)

    bulletUpdate(dt)
    spawnAble(dt)
    shootAble(dt)
    EnemyUpdate(dt)
    bulletHit()

    if(love.keyboard.isDown("left") and player.x > 0) then
        player.x = player.x - 250 * dt
    end
    if(love.keyboard.isDown("right") and player.x < width) then
        player.x = player.x + 250 * dt
    end
    if(love.keyboard.isDown("space") and canShoot) then
        createBullet(dt)
    end

    if(alive == false and love.keyboard.isDown("r")) then
        for i = 0, #Enemys do
            Enemys[i] = nil  
        end
        alive = true  
        score = 0
    end
end

------------------------------------------------------------------------
function shootAble(dt)
    canShootTimer = canShootTimer - (1 * dt)
    if canShootTimer < 0 then
        canShoot = true
    end
end

function spawnAble(dt)
    spawnTimer = spawnTimer + dt
    if(spawnTimer > difficulty) then
        spawnTimer = 0
        createEnemy()
        if(difficulty < 0.3) then
            difficulty = difficulty - 0.01
        end
    end
end

------------------------------------------------------------------------

function createBullet(dt)
    newBullet = {x = player.x + 22  , y = player.y - 25}
    table.insert(bullets, newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
end

function bulletDraw()
    for i, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, 4, 10)
    end
end

function bulletUpdate(dt)

    for i, bullet in ipairs(bullets) do

        bullet.y = bullet.y - (200 * dt)

        if bullet.y < 0 then 
            table.remove(bullets, i)
        end
    end
end

------------------------------------------------------------------------

function createEnemy()
    if(alive) then
        local model
        local random = love.math.random(1,3)
        if(random == 1) then
            model = asteroid1
        end
        if(random == 2) then
            model = asteroid2
        end
        if(random == 3) then
            model = asteroid3
        end
        newEnemy = {x = love.math.random(30,width - 30)  , y = 0, image = model, speed = love.math.random(90,150)}
        table.insert(Enemys, newEnemy)
    end
end

function EnemyDraw()
    for i, Enemy in ipairs(Enemys) do
        love.graphics.draw(Enemy.image, Enemy.x, Enemy.y, 0, 0.4, 0.4)
    end
end

function EnemyUpdate(dt)

    for i, Enemy in ipairs(Enemys) do

        Enemy.y = Enemy.y + (Enemy.speed * dt)

        if Enemy.y > 600 then 
            table.remove(Enemys, i)
        end
    end
end

function bulletHit() 
    for i, Enemy in ipairs(Enemys) do
        for j, bullet in ipairs(bullets) do
            if CheckCollision(Enemy.x, Enemy.y, 40, 40, bullet.x, bullet.y, 4, 10) then
                table.remove(bullets, j)
                table.remove(Enemys, i)
                score = score + 1
            end 
        end
    end
    for i, Enemy in ipairs(Enemys) do
        if CheckCollision(Enemy.x, Enemy.y, 25, 25, player.x, player.y, 50, 50) then
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


