Paddle = {}

function Paddle:load()
	self.width = 100
	self.height = 20
	self.x = (love.graphics.getWidth()/2)-(self.width/2)
	self.y = love.graphics.getHeight()-self.height
	self.speed = 500
end

function Paddle:update(dt)
	if (love.keyboard.isDown("a"))and(self.x>=0) then
		self.x = self.x - self.speed*dt
	elseif (love.keyboard.isDown("d"))and((self.x+self.width)<=love.graphics.getWidth()) then
		self.x = self.x + self.speed*dt
	end
end

function Paddle:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end