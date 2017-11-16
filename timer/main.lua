require 'timer'

function love.load()
  createTimer("kek1")
  timerControl("kek1", "start")
  createTimer("kek2")
end

function love.draw()
  love.graphics.print(timerControl("kek1", "get"),0,0)
  love.graphics.print(timerControl("kek2", "get"),0,10)
end

function love.update(dt)
  timerUpdate("kek1", dt)
  timerUpdate("kek2", dt)
  if timerControl("kek1", "get") >= 5 and timerControl("kek1", "get") <= 10 then
    timerControl("kek2", "start")
  else
    timerControl("kek2", "stop")
  end
end
