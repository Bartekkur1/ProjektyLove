tick = 0
squares = {}

function love.load()
    for x=0,50 do 
        for y=0,50 do 
            createSquare(10*x,10*y,10,10)
        end 
    end
end

function love.draw()
    love.graphics.setColor(255,255,255)
    love.graphics.print(table.getn(squares),760,0)
    love.graphics.print(tick,760,10)

    for i, square in ipairs(squares) do
        love.graphics.setColor(square.t,10,10)
        love.graphics.rectangle("fill", square.x, square.y, square.r, square.r)
    end
end

function love.update(dt)
    tick = tick + 0.03
    if tick >= 1 then
        tick = -1
    end

    for i, square in ipairs(squares) do

        square.x = square.x + math.sin(tick)/10000 * square.t

        if math.dist(love.mouse.getX(),love.mouse.getY(),square.x,square.y) < 9 then
            square.t = square.t + 10
        end
    end
end

function createSquare(x,y,r,t)
    newSquare = {x = x, y = y,r = r,t = t}
    table.insert(squares,newSquare)
end

function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end