framecounterX = math.pi/2
framecounterY = 0
Frames = 0
circle = {
    x = 0,
    y = love.graphics.getHeight() / 2,
    radius = 80
}
line = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() / 2,
}
points = {}

function love.draw()
    love.graphics.circle("line",circle.x,circle.y,80)   
    love.graphics.line(
        circle.x,
        circle.y,
        circle.x - xsin * circle.radius,
        circle.y - ysin * circle.radius
    )
    for i, point in ipairs(points) do
	    love.graphics.points(point.x, point.y)
    end
    love.graphics.print(Frames,0,0)
end
function love.update(dt)
    framecounterX = framecounterX + 0.01
    framecounterY = framecounterY + 0.01
    Frames = Frames + 1
    xsin = math.sin(framecounterX)
    ysin = math.sin(framecounterY)
    if (Frames % 2 == 1) then
        newPoint = { x = circle.x - xsin * circle.radius, y = circle.y - ysin * circle.radius}
	    table.insert(points, newPoint)
        circle.x = circle.x + math.pi/2
    end
end