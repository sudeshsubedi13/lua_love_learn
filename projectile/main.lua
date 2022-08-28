function love.load()
    Width = 1200
    Height= 1200 * 9 / 16
    Ground = Height * 0.8
    Xoffset = 100
    Yoffset = 80
    Angle = 0
    AngleText = "Angle: "..Angle
    InitialSpeed = 200
    Gravity = 30
    Projectile = {}
    Projectile.isactive = false
    Projectile.isempty = false
    love.window.setMode(Width, Height, {})
    love.graphics.setNewFont(20)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setBackgroundColor(love.math.colorFromBytes(26, 100, 153))
    Ball = {}
    Ball.r = 5
    Ball.x = Xoffset+Ball.r
    Ball.y = Ground-Ball.r-Yoffset
    Ball.released = false
    Ball.landed = false
    Ball.Yvelocity = 0
end

function love.update(dt)
    if Projectile.isactive and (not Projectile.isempty) then
        Ball.x = love.mouse.getX()
        Ball.y = love.mouse.getY()
    end

    if Ball.released and (not Ball.landed) then
        Ball.x = Ball.x + InitialSpeed * math.cos(Angle) * dt
        Ball.y = Ball.y - InitialSpeed * math.sin(Angle) * dt + Gravity * dt * dt / 2 + Ball.Yvelocity*dt
        Ball.Yvelocity = Ball.Yvelocity + Gravity*dt
    end
    if not Ball.released then
        Angle = math.atan2(Yoffset+Ball.y - Ground, Xoffset-Ball.x)
    end
    if Ball.y >= Ground then
        Ball.y = Ground - Ball.r
        Ball.landed = true
    end
end

function love.draw()
    love.graphics.setColor(love.math.colorFromBytes(60, 234, 35))
    love.graphics.rectangle("fill", 0, Ground, Width, Ground)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", Xoffset, Ground-Yoffset, 5, Yoffset)
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", Ball.x, Ball.y, Ball.r)
    love.graphics.setColor(0, 0, 0)
    AngleText = "Angle: "..Angle * 180 / math.pi
    love.graphics.print(AngleText, Width/2-20, 20)
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if (math.abs(x - Ball.x) <= 20) and (math.abs(y- Ball.y) <= 20) then
            --print('test')
            if not Projectile.isempty then Projectile.isactive = true end
        end 
    end
end

function love.mousereleased(x, y, button, istouch)
    if button == 1 and Projectile.isactive then
        Projectile.isempty = true
        Projectile.isactive = false
        Ball.released = true
    end
end

function love.quit()
    print("bye")
end

