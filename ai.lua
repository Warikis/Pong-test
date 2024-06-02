AI = {}

function AI:load()
    self.img = love.graphics.newImage("assets/bot.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVelocity = 0
    self.speed = 500

    self.timer = 0
    self.rate = 0.5
end


function AI:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:acquireTarget()
    end
end


function AI:move(dt)
    self.y = self.y + self.yVelocity * dt
end


function AI:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVelocity = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVelocity = self.speed
    else
        self.yVelocity = 0
    end
end


function AI:checkBoundaries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function AI:draw()
    love.graphics.draw(self.img, self.x, self.y)
end