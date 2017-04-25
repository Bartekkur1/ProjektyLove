
bufor = 0

mnoznikX = 90
mnoznikY = 30

mnoznikZ = 10


    -- 800 x 600 --

    --------------- rect -------------
    point1 = {x = 300, y = 200, z = 0}
    point2 = {x = 500, y = 200, z = 0}
    point3 = {x = 300, y = 400, z = 0}
    point4 = {x = 500, y = 400, z = 0}

    point5 = {x = 300, y = 200, z = 0}
    point6 = {x = 500, y = 200, z = 0}
    point7 = {x = 300, y = 400, z = 0}
    point8 = {x = 500, y = 400, z = 0}

function love.draw()

    love.graphics.setColor(255,255,255)
    love.graphics.print(bufor,0,0)
    love.graphics.print(mnoznikY,0,10)

    if mnoznikY > 0 then
        love.graphics.setColor(0,255,0)
    end

    if mnoznikY < 0 then
        love.graphics.setColor(255,0,0)
    end

    love.graphics.points(point1.x,point1.y)
    love.graphics.points(point2.x,point2.y)
    love.graphics.points(point3.x,point3.y)
    love.graphics.points(point4.x,point4.y)

    love.graphics.points(point5.x,point5.y)
    love.graphics.points(point6.x,point6.y)
    love.graphics.points(point7.x,point7.y)
    love.graphics.points(point8.x,point8.y)

    love.graphics.line(point1.x,point1.y,point2.x,point2.y)
    love.graphics.line(point2.x,point2.y,point4.x,point4.y)
    love.graphics.line(point3.x,point3.y,point4.x,point4.y)
    love.graphics.line(point1.x,point1.y,point3.x,point3.y)

    love.graphics.line(point5.x,point5.y,point6.x,point6.y)
    love.graphics.line(point6.x,point6.y,point8.x,point8.y)
    love.graphics.line(point7.x,point7.y,point8.x,point8.y)
    love.graphics.line(point5.x,point5.y,point7.x,point7.y)

    love.graphics.line(point1.x,point1.y,point5.x,point5.y)
    love.graphics.line(point2.x,point2.y,point6.x,point6.y)
    love.graphics.line(point3.x,point3.y,point7.x,point7.y)
    love.graphics.line(point4.x,point4.y,point8.x,point8.y)

end

function love.update(dt)

    point1.x = 400 + math.cos(bufor + math.pi) * mnoznikX
    point2.x = 400 + math.cos(bufor + math.pi/2) * mnoznikX
    point3.x = 400 + math.cos(bufor + math.pi+math.pi/2) * mnoznikX
    point4.x = 400 + math.cos(bufor + 2*math.pi) * mnoznikX

    point1.y = 350 + math.sin(bufor + math.pi) * mnoznikY
    point2.y = 350 + math.sin(bufor + math.pi/2) * mnoznikY
    point3.y = 350 + math.sin(bufor + math.pi+math.pi/2) * mnoznikY
    point4.y = 350 + math.sin(bufor + 2*math.pi) * mnoznikY

    point5.x = 400 + math.cos(bufor + math.pi) * mnoznikX
    point6.x = 400 + math.cos(bufor + math.pi/2) * mnoznikX
    point7.x = 400 + math.cos(bufor + math.pi+math.pi/2) * mnoznikX
    point8.x = 400 + math.cos(bufor + 2*math.pi) * mnoznikX

    point5.y = 250 + math.sin(bufor + math.pi) * mnoznikY
    point6.y = 250 + math.sin(bufor + math.pi/2) * mnoznikY
    point7.y = 250 + math.sin(bufor + math.pi+math.pi/2) * mnoznikY
    point8.y = 250 + math.sin(bufor + 2*math.pi) * mnoznikY



    if love.keyboard.isDown("up") and mnoznikY < 90 then
        mnoznikY = mnoznikY + 0.1
    end
    if love.keyboard.isDown("down") and mnoznikY > -90 then
        mnoznikY = mnoznikY - 0.1
    end

    if love.keyboard.isDown("left") then
        bufor = bufor + math.pi/2 * dt
    end
    if love.keyboard.isDown("right") then
        bufor = bufor - math.pi/2 * dt
    end

end