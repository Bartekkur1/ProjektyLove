player = {
  x = 50,
  y = 300,
  velY = 0,
  size = 30
}

function player:Update(dt)
  self.velY = self.velY + 15 * dt
  if self.y < 550 then
    self.y = self.y + self.velY
  end
  if love.keyboard.isDown("space") and self.y > 30 and self.y < 600 then
    self.velY = -4
    self.y = self.y + self.velY
  end
end

function player:Draw()
  love.graphics.rectangle("line", self.x, self.y, self.size, self.size)
end
