width = love.graphics.getWidth()
height = love.graphics.getHeight()
points = {}
x = 2
clear = false

function love.load()
    tableInsert()
end

function love.draw()
    love.graphics.setColor(128, 128, 128)
    love.graphics.line(width/2,0,width/2,height)
    love.graphics.line(0,height/2,width,height/2)
    love.graphics.translate(width/2, height/2)
    love.graphics.setColor(255,0,0)
    for i = 2, #points do
        local prev = points[i - 1]
        local curr = points[i]

        love.graphics.line(prev.x,prev.y,curr.x,curr.y)
    end
end

function love.update(dt)
    if clear then
        love.graphics.clear()
    end
end

function tableInsert()
    for i = -400, 400,0.1 do
        point = {x = i * 20 , y = math.pow(i,2)-3*i-math.sqrt(2) }
        table.insert(points,point)
    end
    for i, point in ipairs(points) do
        if point.x <= width or point.x >= 0 then
            if point.y <= height or point.y >= 0 then
                love.graphics.points(point.x, point.y)
            end
        end
    end
end

function love.keyreleased(key)
   if key == "escape" then
      love.event.quit()
   end
   if key == "left" then
      x = x - 1
      tableInsert()
   end
   if key == "right" then
      x = x + 1
      tableInsert()
   end
   if key == "up" then
      clear = not clear
   end
end