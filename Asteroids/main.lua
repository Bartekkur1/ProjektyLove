width = love.graphics.getWidth()
height = love.graphics.getHeight()
ship = {x = width/2, y = height/2, vX = 0, vY = 0, rotation = 0, speed = 1}
bullets = {}
asteroids = {}
shootTimer = 0
spawnTimer = 300
points = 0
canShoot = true
alive = true

function love.draw()
    love.graphics.translate(ship.x, ship.y)
    love.graphics.rotate(math.pi/2)
    love.graphics.rotate(-ship.rotation)
    if alive then
        love.graphics.polygon("fill",0,-15, 10,10, -10,10)
    end
    love.graphics.origin()
    if alive == false then
        love.graphics.print("GAME OVER",width/2-30,height/2)
    end
    love.graphics.print("Points : "..points,0,0)
    --love.graphics.print(,0,10)
    love.graphics.origin()
    for i, bullet in ipairs(bullets) do
        love.graphics.points(bullet.x, bullet.y)
    end
    for k, asteroid in ipairs(asteroids) do
       love.graphics.circle("fill", asteroid.x, asteroid.y, asteroid.r)
    end
    love.graphics.origin()
end

function love.update(dt)

    speedLimit()
    canvasOut()
    playerControls(dt)
    bulletMech(dt)
    basicMech()
    asteroidMech(dt)

end


function collidePointCircle(x, y, cx, cy, d)
    if distance(x,y,cx,cy) <= d/2 then
        return true;
    else
        return false;
    end
end

function asteroidMech(dt)
    if spawnTimer >= 0 then
        spawnTimer = spawnTimer - 0.1
    else
        asteroidAdd(0 or width, 0 or height, math.random(-2*math.pi,2*math.pi), 0, 0, 30, 250)
        spawnTimer = 500
    end

    for i, asteroid in ipairs(asteroids) do
        asteroid.y = asteroid.y - math.sin(asteroid.rot)  * asteroid.speed * dt
        asteroid.x = asteroid.x + math.cos(asteroid.rot)  * asteroid.speed * dt 

        if asteroid.r <= 10 then
            table.remove(asteroids, i)
        end

        if asteroid.x >= width then
            asteroid.x = 0.5
        end
        if asteroid.x <= 0 then
            asteroid.x =  width - 0.5
        end

        if asteroid.y >= height then
            asteroid.y = 0.5
        end
        if asteroid.y <= 0 then
            asteroid.y = height - 0.5
        end
    end

    for j, bullet in ipairs(bullets) do
	    for i, asteroid in ipairs(asteroids) do
            if collidePointCircle(bullet.x, bullet.y, asteroid.x, asteroid.y, asteroid.r) then
                table.remove(bullets, j)
                table.remove(asteroids, i)
                points = points + 1
                asteroidAdd(asteroid.x, asteroid.y, asteroid.rot * math.sin(math.pi/3), asteroid.vX, asteroid.vY, asteroid.r/2, asteroid.speed)
                asteroidAdd(asteroid.x, asteroid.y, asteroid.rot / math.sin(2*math.pi/7), asteroid.vX, asteroid.vY, asteroid.r/2, asteroid.speed)
            end
        end
	end
end

function asteroidAdd(posx, posy, rotat, veX, veY, pro, sp33d)
    newAsteroid = {x = posx, y = posy, rot = rotat, vX = veX, vY = veY, r = pro, speed = sp33d}
    table.insert(asteroids,newAsteroid)
end

function basicMech()
    if ship.rotation >= (2*math.pi) or ship.rotation <= -(2*math.pi) then
        ship.rotation = 0
    end

    ship.x = ship.x + ship.vX
    ship.y = ship.y + ship.vY

    for k, asteroid in ipairs(asteroids) do
       if distance(ship.x,ship.y,asteroid.x,asteroid.y) <= asteroid.r then
        alive = false
       end
    end
end

function speedLimit()
    if ship.vX >= 0.3 then
        ship.vX = 0.3
    end
    if ship.vX <= -0.3 then
        ship.vX = -0.3
    end

    if ship.vY >= 0.3 then
        ship.vY = 0.3
    end
    if ship.vY <= -0.3 then
        ship.vY = -0.3
    end
end

function canvasOut()
    if ship.x >= width then
        ship.x = 0.5
    end
    if ship.x <= 0 then
        ship.x =  width - 0.5
    end

    if ship.y >= height then
        ship.y = 0.5
    end
    if ship.y <= 0 then
        ship.y = height - 0.5
    end
end

function bulletAdd()
    newBullet = {x = ship.x, y = ship.y, rot = ship.rotation, vX = ship.vX, vY = ship.vY}
    table.insert(bullets,newBullet)
end

function bulletMech(dt)
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - math.sin(bullet.rot) + bullet.vX * 20 * dt
        bullet.x = bullet.x + math.cos(bullet.rot) + bullet.vY * 20 * dt 

        if bullet.x >= width then
            table.remove(bullets, i)
        end
        if bullet.x <= 0 then
            table.remove(bullets, i)
        end

        if bullet.y >= height then
            table.remove(bullets, i)
        end
        if bullet.y <= 0 then
            table.remove(bullets, i)
        end
    end
end

function playerControls(dt)

    if love.keyboard.isDown("left") then
        ship.rotation = ship.rotation + 3 * dt
    end

    if love.keyboard.isDown("right") then
        ship.rotation = ship.rotation - 3 * dt
    end

    -- osX = cos / osY = sin --

    if love.keyboard.isDown("up") then
        ship.vX = ship.vX + math.cos(ship.rotation) * ship.speed * dt
        ship.vY = ship.vY - math.sin(ship.rotation) * ship.speed * dt
    end

    if love.keyboard.isDown("space") and canShoot then
        bulletAdd()
    end

        shootTimer = shootTimer - (5 * dt)
    if shootTimer <= 0 then
        canShoot = true
        shootTimer = shootTimer + 1
    else
        canShoot = false
    end
end

function distance(x1,y1,x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
