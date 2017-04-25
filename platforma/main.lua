
buforX = 0
buforZ = 0
buforY = 0

mnoznikX = 100
mnoznikZ = 10
mnoznikY = 50

    -- 800 x 600 --

    ------------ rect ----------
    point1 = {x = 300, y = 200, z = 0}
    point2 = {x = 500, y = 200, z = 0}
    point3 = {x = 300, y = 400, z = 0}
    point4 = {x = 500, y = 400, z = 0}


function love.draw()

    love.graphics.points(point1.x,point1.y)
    love.graphics.points(point2.x,point2.y)
    love.graphics.points(point3.x,point3.y)
    love.graphics.points(point4.x,point4.y)

    love.graphics.print(buforY,0,0)
    love.graphics.print(buforX,0,10)
    love.graphics.print(buforZ,0,20)
end

function love.update()

    --mouseX = love.mouse.getX()/100

    buforY = buforY + math.pi/180
    buforX = buforX + math.pi/180

    point1.x = 400 + math.cos(buforX + math.pi) * mnoznikX
    point2.x = 400 + math.cos(buforX + math.pi/2) * mnoznikX
    point3.x = 400 + math.cos(buforX + math.pi+math.pi/2) * mnoznikX
    point4.x = 400 + math.cos(buforX + 2*math.pi) * mnoznikX

    point1.y = 300 + math.sin(buforX + math.pi) * mnoznikY
    point2.y = 300 + math.sin(buforX + math.pi/2) * mnoznikY
    point3.y = 300 + math.sin(buforX + math.pi+math.pi/2) * mnoznikY
    point4.y = 300 + math.sin(buforX + 2*math.pi) * mnoznikY

end