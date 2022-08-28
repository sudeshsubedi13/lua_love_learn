function love.load()
    love.graphics.setNewFont(12)
    love.graphics.setColor(255, 0, 0)
    love.graphics.setBackgroundColor(255,255,255)
    Position = {x = 0, y = 0}
    Speed = 80
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        if Position.y <= 0 then
            Position.y = 0
            return
        end
        Position.y = Position.y - Speed * dt
    end
    if love.keyboard.isDown("down") then
        if Position.y >= love.graphics.getHeight() then
            Position.y = love.graphics.getHeight()
            return
        end
        Position.y = Position.y + Speed * dt
    end
    if love.keyboard.isDown("left") then
        if Position.x <= 0 then
            Position.x = 0
            return
        end
        Position.x = Position.x - Speed * dt
    end
    if love.keyboard.isDown("right") then
        if Position.x >= love.graphics.getWidth() then
            Position.x = love.graphics.getWidth()
            return
        end
        Position.x = Position.x + Speed * dt
    end
end

function love.draw()
    love.graphics.rectangle("fill", Position.x, Position.y, 5, 5)
end

function love.quit()
    print("bye")
end