require 'loadingAnimation'
require 'tiles'

function love.load()
  tile_new(0,1,"settings.png")
end

function love.draw()
  -- class functions here
  draw_lA()
  tile_draw()
  --
end

function love.update(dt)
  -- class functions here
  update_lA()
  --
  if love.mouse.isDown(1) then
    lA_start()
  end
  if love.mouse.isDown(2) then
    lA_stop()
  end
end
