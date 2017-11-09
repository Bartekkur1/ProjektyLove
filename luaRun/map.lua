map = {}

function map_Test()
    for i=1,4 do
        newLine = {x = i*100, y = 0}
        table.insert(map, newLine)
    end
end

function map_Draw()
    for i, line in ipairs(map) do
        love.graphics.line(line.x, line.y, line.x, 800)
    end
end