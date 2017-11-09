require 'player'
require 'map'
require 'asteroid'
require 'timer'

game_runing = true

mouseX = love.mouse.getX()
mouseY = love.mouse.getY()

function love.load()
    map_Test()
    timer_Start()
end

function love.draw()
    if game_runing then
        map_Draw()
        player_Draw()
        asteroid_Draw()
    else

    end
end

function love.update(dt)
    if game_runing then
        player_Update(dt)
        asteroid_Update(dt)
        timer_Update(dt)
    end
end

