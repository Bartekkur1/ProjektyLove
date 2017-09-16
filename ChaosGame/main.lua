
    dots = {}
    pointer = {x = 400, y = 300}
    point1 = {x = 400, y = 100}
    point2 = {x = 200, y = 500}
    point3 = {x = 600, y = 500}

function love.draw()

    love.graphics.points(point1.x,point1.y)
    love.graphics.points(point2.x,point2.y)
    love.graphics.points(point3.x,point3.y)
    love.graphics.points(pointer.x,pointer.y) 

    for i, dot in ipairs(dots) do
        love.graphics.points(dot.x, dot.y)
    end

end

function losowa()

    local x = love.math.random(1, 6)
    return x

end

function love.update(dt)

    if losowa() == 1 then
    
        local sX = pointer.x - point1.x 
        local sY = pointer.y - point1.y
        
        pointer.x = pointer.x - sX/2
        pointer.y = pointer.y - sY/2

        newDot = { x = pointer.x, y = pointer.y }
        table.insert(dots, newDot)

    end

    if losowa() == 2 then

        local sX = pointer.x - point2.x 
        local sY = pointer.y - point2.y
        
        pointer.x = pointer.x - sX/2
        pointer.y = pointer.y - sY/2

        newDot = { x = pointer.x, y = pointer.y }
        table.insert(dots, newDot)


    end

    if losowa() == 3 then

        local sX = pointer.x - point3.x 
        local sY = pointer.y - point3.y
        
        pointer.x = pointer.x - sX/2
        pointer.y = pointer.y - sY/2

        newDot = { x = pointer.x, y = pointer.y }
        table.insert(dots, newDot)


    end


end
