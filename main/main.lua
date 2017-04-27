
points = {}
ilePtk = 10

function clearTable()

    points = { }

end

function generatePoints(L)

    for i = 1, L do
        points[i] = {x = 400, y = 300, rot = 0}
    end

end

function circPoints(L)

    local degre = L/2

    for i = 1, #points do
        points[i].x = points[i].x + math.sin(math.pi/2 +  i * math.pi/degre ) * 100
        points[i].y = points[i].y + math.sin( i * math.pi/degre ) * 100
    end


end

function circLines()

    for i = 1, #points-2 do
        --love.graphics.line(points[i].x, points[i].y, points[i + 2].x, points[i + 2].y  )
    end 

    --love.graphics.line(points[1].x, points[1].y, points[#points-1].x, points[#points-1].y )
    --love.graphics.line(points[2].x, points[2].y, points[#points].x, points[#points].y)

end

generatePoints(ilePtk)
circPoints(ilePtk)


function love.draw()

    circLines()
    for i = 1, #points do
        love.graphics.points(points[i].x, points[i].y)
    end
    love.graphics.print(ilePtk,0,0)
end

function love.keyreleased(key)
   if key == "escape" then
      love.event.quit()
    end
end

function love.update()

    if love.keyboard.isDown("right") then
        ilePtk = ilePtk + 1
        clearTable()
        generatePoints(ilePtk)
        circPoints(ilePtk)
    end

    if love.keyboard.isDown("left") then
        ilePtk = ilePtk - 1
        clearTable()
        generatePoints(ilePtk)
        circPoints(ilePtk)
    end
end