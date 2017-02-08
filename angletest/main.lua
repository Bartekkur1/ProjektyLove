point1 = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2 - 50}
point2 = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2 + 50}
framecounter = math.pi/2
test = 0
function love.draw()
    love.graphics.points(point1.x,point1.y)
    love.graphics.points(point2.x,point2.y)
    love.graphics.line(point1.x,point1.y,point2.x,point2.y)
    love.graphics.print(""..test,0,0)
end
function love.update(dt)
    test = math.angle(point1.x,point1.y,point2.x,point2.y)
    point1.x = point1.x + math.sin()
end
function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
function math.angle(x1,y1, x2,y2) 
    return math.atan2(y2-y1, x2-x1) 
end