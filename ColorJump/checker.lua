checkers = {}

function checkers_New(height)
  newCheck = {
    x = love.graphics.getWidth()/2,
    y = height,
    checked = false
  }
  table.insert(checkers, newCheck)
end

function checkers_Update()
  for i, check in ipairs(checkers) do
    if math.dist(player.x, player.y, check.x, check.y) < 10 and check.checked == false then
      lvl_up()
      points = points + 1
      check.checked = true
    end
  end
end
