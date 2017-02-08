
local anim8 = require 'anim8'

function love.load()
  image = love.graphics.newImage('ken.png')

                         -- frame, image,    offsets, border
  local ken = anim8.newGrid( 95, 120, 1000, 1020, 0, 0, 0)

  kenn = anim8.newAnimation(ken('1-5',1), 0.1)

end

function love.draw()

  kenn:draw(image, 100, 400)

end

function love.update(dt)

  kenn:update(dt)

end

