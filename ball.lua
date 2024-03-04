Ball = {}

function Ball:load()
	self.width = 20
	self.height = 20
	
	self.x0 = (love.graphics.getWidth()/2)-(self.width/2)
	self.y0 = (love.graphics.getHeight()/2)-(self.height/2)
	
	self.speed = 500
	self.inc = 5
	
	Ball:respawn()
end

function Ball:move(dt)
	if not(self.x>0 and self.x+self.width<love.graphics.getWidth()) then
		self.vx = - self.vx
	end
	
	if not(self.y>70) then
		self.vy = -self.vy
	elseif not(self.y+self.height<love.graphics.getHeight()) then
		Stats:loselife()
		Stats:onoff()
		Ball:respawn()
	end
	
	self.x = self.x+self.vx*dt
	self.y = self.y+self.vy*dt
end

function Ball:respawn()
	self.x = self.x0
	self.y = self.y0
	math.randomseed(os.time())
	self.vx = math.random(-1,1)*math.random()*self.speed
	self.vy = self.speed
end

function Ball:update(dt)
	self:move(dt)
	self:colPaddle(dt)
	self:colBlock(dt)
end

function Ball:changeVel(element)
	self.vy = -self.vy
	local mb = self.x + self.width/2
	local mp = element.x + element.width/2
	local pos = mb - mp
	self.vx = pos*self.inc
end

function Ball:overCol()
	m = math.max(math.abs(self.vx),math.abs(self.vy))
	local vx = self.vx/m
	local vy = self.vy/m
		
	local k = 0
	while checkCollision(self,Paddle) do
		k = k+1
		self.x = self.x-vx*k
		self.y = self.y-vy*k
	end
end

function Ball:colPaddle()
	if checkCollision(self,Paddle) then
		Ball:overCol()
		self:changeVel(Paddle)
	end
end

function Ball:colBlock()
	for i,b in ipairs(blocks) do
		if checkCollision(self,b) then
			Ball:overCol()
			self:changeVel(b)
			Stats:earnscore((8-b.py)*(Stats.level+1))
			table.remove(blocks,i)
			if #blocks==0 then
				Stats:levelup()
				Block:createBlocks()
				Ball:respawn()
			end
			break
		end
	end
end

function Ball:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end