timer = {time = 0, runing = false}

function timer_Start()
    if timer.runing == false then
        timer.runing = true
    end
end

function timer_Stop()
    if timer.runing then
        timer.runing = false
    end
end

function timer_Reset()
    timer.time = 0
end

function timer_Update(dt)
    timer.time = timer.time + dt
end
