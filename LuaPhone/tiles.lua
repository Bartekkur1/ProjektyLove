tiles = {}
              -- x(0,1) , y(0,-)
function tile_new(indexX, indexY, _icon)
  newTile = {x = 20 + indexX * 230, y = 20 + indexY * 230, icon = _icon}
  table.insert(tiles,newTile)
end

function tile_draw()
  for i, tile in ipairs(tiles) do
    love.graphics.draw(love.graphics.newImage(tile.icon), tile.x, tile.y)
    love.graphics.rectangle("line", tile.x, tile.y, 128, 128)
  end
end
