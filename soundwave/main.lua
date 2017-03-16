points = {}
rotation = 0
ready = true
walls = { }

function love.update()
    if love.keyboard.isDown("left") then
        ready = true
    end
    if love.mouse.isDown(1) and ready then
        pointsCircle(love.mouse.getX(),love.mouse.getY())
        ready = false   
    end

    for i,point in pairs(points) do
        point.x = point.x + point.vX * math.cos(point.rot)
        point.y = point.y + point.vY * math.sin(point.rot)
        if point.x > 800 then
            point.vX = point.vX * -1
        end
        if point.x < 0 then
            point.vX = point.vX * -1
        end
        if point.y > 600 then
            point.vY = point.vY * -1
        end
        if point.y < 0 then
            point.vY = point.vY * -1
        end
    end

end

function love.draw()
    for i,point in pairs(points) do
      love.graphics.points(point.x,point.y)
    end
end

function pointInsert(x,y,r,vX,vY)
    point = {x = x, y = y, vX = vX, vY = vY, rot = r}
    table.insert(points,point)
end

function pointsCircle(x,y)
    for i=1,360 do 
        pointInsert(x,y,i*math.pi/180,3,3)
    end
end

function math.dist(x1,y1, x2,y2)
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
