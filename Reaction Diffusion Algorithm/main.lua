width = love.graphics.getWidth()
height= love.graphics.getHeight()
map = {}
next = {}
dA = 1
dB = 0.5
feed = 0.055
k = 0.062

sizeX = 800
sizeY = 600

-- index 1 to red 2 to blue 3 to green

function swap()
    temp = map
    map = next
    next = temp
end

function drop(_x, _y)
    for x=_x - 5, _x + 5 do
        for y=_y -5, _y + 5 do
            map[x][y][3] = 1
        end
    end 
end

function laplaceA(x, y)
    sumA = 0
    sumA = sumA + map[x][y][1] * -1

    sumA = sumA + map[x-1][y][1] * 0.2
    sumA = sumA + map[x+1][y][1] * 0.2
    sumA = sumA + map[x][y+1][1] * 0.2
    sumA = sumA + map[x][y-1][1] * 0.2

    sumA = sumA + map[x-1][y-1][1] * 0.05
    sumA = sumA + map[x+1][y-1][1] * 0.05
    sumA = sumA + map[x-1][y+1][1] * 0.05
    sumA = sumA + map[x+1][y+1][1] * 0.05
    return sumA
end

function laplaceB(x, y)
    sumB = 0
    sumB = sumB + map[x][y][3] * -1

    sumB = sumB + map[x-1][y][3] * 0.2
    sumB = sumB + map[x+1][y][3] * 0.2
    sumB = sumB + map[x][y+1][3] * 0.2
    sumB = sumB + map[x][y-1][3] * 0.2

    sumB = sumB + map[x-1][y-1][3] * 0.05
    sumB = sumB + map[x+1][y-1][3] * 0.05
    sumB = sumB + map[x-1][y+1][3] * 0.05
    sumB = sumB + map[x+1][y+1][3] * 0.05
    return sumB
end

function love.load()
    for i=1, sizeX do
        map[i] = {}
        next[i] = {}
        for j=1, sizeY do
            next[i][j] = {1,0,0}
            map[i][j] = {1,0,0}
        end
    end
    drop(124,75)
    drop(634,493)
end

function love.draw()
    love.graphics.setBackgroundColor(255,255,255)
    for x=2, sizeX-1 do
        for y=2, sizeY-1 do
            c = (map[x][y][1] - map[x][y][3])*255
            love.graphics.setColor(c,c,c)
            love.graphics.points(x,y)
        end
    end
end

function love.update()
    for x=2, sizeX-1 do
        for y=2, sizeY-1 do
            a = map[x][y][1]
            b = map[x][y][3]
            next[x][y][1] = a + (dA * laplaceA(x,y)) - (a * b * b) + (feed * (1-a))
            next[x][y][3] = b + (dB * laplaceB(x,y)) + (a * b * b) - ((k + feed) * b)
        end
    end
    swap()
end