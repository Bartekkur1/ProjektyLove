width = love.graphics.getWidth()
height = love.graphics.getHeight()
player = {x = width/2, y = 450}
bullets = {}
Enemys = {}
canShoot = true
shootTimer = 0
spawnTimer = 0

function love.load()
    playerIMG = love.graphics.newImage("player.png")
end

function love.draw()

    love.graphics.print(spawnTimer,0,0)
    love.graphics.draw(playerIMG, player.x, player.y)
    bulletDraw()
    EnemyDraw()

end

function love.update(dt)

    bulletUpdate(dt)
    spawnAble(dt)
    shootAble(dt)
    EnemyUpdate(dt)
    bulletHit()

    if(love.keyboard.isDown("left")) then
        player.x = player.x - 250 * dt
    end
    if(love.keyboard.isDown("right")) then
        player.x = player.x + 250 * dt
    end
    if(love.keyboard.isDown("space") and canShoot) then
        createBullet(dt)
    end
end

------------------------------------------------------------------------
function shootAble(dt)
    shootTimer = shootTimer + dt
    if(shootTimer > 1) then
        shootTimer = 0
        canShoot = true
    end
end

function spawnAble(dt)
    spawnTimer = spawnTimer + dt
    if(spawnTimer > 1) then
        spawnTimer = 0
        createEnemy()
    end
end

------------------------------------------------------------------------

function createBullet(dt)
    canShoot = false
    newBullet = {x = player.x + 22  , y = player.y - 25}
    table.insert(bullets, newBullet)
end

function bulletDraw()
    for i, bullet in ipairs(bullets) do
        love.graphics.rectangle("fill", bullet.x, bullet.y, 4, 25)
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
	newEnemy = {x = love.math.random(30,770)  , y = 0}
	table.insert(Enemys, newEnemy)
end

function EnemyDraw()
    for i, Enemy in ipairs(Enemys) do
        love.graphics.rectangle("fill", Enemy.x, Enemy.y, 25, 25)
    end
end

function EnemyUpdate(dt)

    for i, Enemy in ipairs(Enemys) do

        Enemy.y = Enemy.y + (100 * dt)

        if Enemy.y > 600 then 
            table.remove(Enemys, i)
        end
    end
end

function bulletHit() 
    for i, Enemy in ipairs(Enemys) do
        for j, bullet in ipairs(bullets) do
            if CheckCollision(Enemy.x, Enemy.y, 25, 25, bullet.x, bullet.y, 4, 25) then
                table.remove(bullets, j)
                table.remove(Enemys, i)
            end
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


