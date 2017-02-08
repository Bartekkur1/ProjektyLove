circle = { x=love.graphics.getWidth()/2,y=love.graphics.getHeight()/2 - 100}
framecounter = math.pi/2
framecounterY = 0
dist = 0
angle = 0

function love.draw()
    love.graphics.circle("fill",circle.x,circle.y,3,3)
    love.graphics.line(love.graphics.getWidth()/2,love.graphics.getHeight()/2,circle.x,circle.y)
    love.graphics.print("".. dist,0,0)
    love.graphics.print("".. angle,0,10)
end
function love.update(dt)
    circle.x = circle.x + math.sin(framecounter) * 10
    circle.y = circle.y + math.sin(framecounterY) * 10
    framecounter = framecounter + 0.1
    framecounterY = framecounterY + 0.1
    dist = math.dist(love.graphics.getWidth()/2,love.graphics.getHeight()/2,circle.x,circle.y)
    angle = math.angle(love.graphics.getWidth()/2,love.graphics.getHeight()/2,circle.x,circle.y)
end
function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
function math.angle(x1,y1, x2,y2) 
    return math.atan2(y2-y1, x2-x1) 
end