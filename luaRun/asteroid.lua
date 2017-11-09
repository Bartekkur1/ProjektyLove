asteroids = {}
difLevel = 1
speed = 300

function asteroid_New(row)
    newAsteroid = {x = 50 + row*100, y = -30}
    table.insert(asteroids, newAsteroid)
end

function asteroid_Draw()
    for i, asteroid in ipairs(asteroids) do
        love.graphics.circle("fill", asteroid.x, asteroid.y, 35)
        love.graphics.line(asteroid.x, asteroid.y, player.x, player.y)
    end
end

function asteroid_Update(dt)
    lastRand = rand
    rand = math.random(0,4)
    for i, asteroid in ipairs(asteroids) do
        asteroid.y = asteroid.y + (difLevel * dt) * speed -- dokonczyc tutaj
        if asteroid.y > love.graphics.getHeight() + 50 then
            table.remove(asteroids, i)
            player.score = player.score + 1
        end
    end
    if timer.time > 0.5 then
        asteroid_New(rand)
        timer_Reset()
    end
end

function asteroid_Reset()
    asteroids = {}
end