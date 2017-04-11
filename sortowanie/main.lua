width = love.graphics.getWidth()
height = love.graphics.getHeight()

framecount = 0
timer = 0
tablica = {}

function love.load()
    for i=1,52 do
        tablica[i] = love.math.random(1,40)
    end
end

function love.draw()
    PillarDraw()
    love.graphics.print(framecount,0,0)
    love.graphics.print(timer,0,10)
end

function love.update(dt)

    framecount = framecount + dt
    if framecount > 0.2 then
        framecount = 0
        timer = timer + 1
        Sort()
        PillarDraw()
    end

end

function squarePillar(h,x,y)
    for i=0,h do
        y = 11*-i
        love.graphics.rectangle("fill", x, y+height-30, 10, 10)
    end
end

function PillarDraw()
    for i=1,table.getn(tablica) do
        squarePillar(tablica[i],i*15,300)
    end
end

function switch(x,y)
    local secmem = tablica[x]
    tablica[x] = tablica[y]
    tablica[y] = secmem
end

function Sort()
    for i = 1, table.getn(tablica)-1 do
        if tablica[i] > tablica[i +  1] then
            switch(i,i+1)
        end
    end
end