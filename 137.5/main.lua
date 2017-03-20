tick = 0
points = {}
rotation = 0
click = 0
canClick = true

function love.draw()
    love.graphics.print(table.getn(points),0,0)
    love.graphics.print(click,0,10)
    for i, point in ipairs(points) do
        love.graphics.points(point.x,point.y)
    end
end

function love.update(dt)
    tick = tick + dt

    if love.keyboard.isDown("right") and canClick then
        click = click + 0.5
        canClick = false
    end

    if love.keyboard.isDown("left") then
        canClick = true
    end

    if tick >= 0.01 then
        tick = 0
        rotation = rotation + click -- <<<<<<<<<<<<
        createPoint(400,300,rotation,0.1)
        click = click + 1
        -- every sec call
    end

    for i, point in ipairs(points) do
        point.x = point.x + point.s * math.cos(point.r)
        point.y = point.y + point.s * math.sin(point.r)

        if point.x >= 800 or point.x <= 0 then
            table.remove(points,i)
            break
        end

        if point.y >= 600 or point.y <= 0 then
            table.remove(points,i)
            break
        end
    end
end

function createPoint(x,y,r,s)
    newPoint = {x = x, y = y, r = r, s = s}
    table.insert(points,newPoint)
end