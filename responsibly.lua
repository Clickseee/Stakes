G.nxkoo_dies = {
    show_watermark = true,
    watermark_image = nil,
    path = SMODS.current_mod.path,
}

do
    local full_path = G.nxkoo_dies.path .. "assets/customimages/watermark.png"
    local file_data = assert(NFS.newFileData(full_path))
    local image_data = assert(love.image.newImageData(file_data))
    G.nxkoo_dies.watermark_image = love.graphics.newImage(image_data)
end

local drawhook = love.draw
function love.draw()
    drawhook()
    if G.nxkoo_dies.show_watermark and G.nxkoo_dies.watermark_image then
        local w, h = love.graphics.getWidth(), love.graphics.getHeight()
        local img = G.nxkoo_dies.watermark_image
        local _xscale = w / img:getWidth()
        local _yscale = h / img:getHeight()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(img, 0, 0, 0, _xscale, _yscale)
    end
end
