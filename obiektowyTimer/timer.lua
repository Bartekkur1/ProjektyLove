timers = {}

--[[

Okej, jest to troche dziwny kod bo moj i pewnie Szymon znajdzie tutaj pełno błędów na ale cóż...
timerControl ma 3 opcje :
  - start (timer ma mozliwosc updatowania)
  - stop (timer traci mozliwosc updatowania)
  - reset (zeruje stoper)
  - get (zwraca time)

]]--

function createTimer(_name)
  newTimer = {time = 0, runing = false, name = _name}
  table.insert(timers, newTimer)
end

function timerUpdate(_name, dt)
  for i,timer in ipairs(timers) do
    if timer.name == _name then
      if timer.runing then
        timer.time = timer.time + dt
      end
    end
  end
end

function timerControl(_name, command)
  for i,timer in ipairs(timers) do
    if timer.name == _name then
      if command == "start" then
        timer.runing = true
      elseif command == "stop" then
        timer.runing = false
      elseif command == "reset" then
        timer.time = 0
      elseif command == "get" then
        return timer.time
      end
    end
  end
end
