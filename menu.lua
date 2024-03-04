Menu = {}

options = {"PLAY GAME","HIGHSCORE","CONTROLS","HELP","QUIT"}

function Menu:load()
	self.X = 220
	self.Y = 200
	self.gap = 50
	self.op = 0
	self.size = 25
end

function Menu:keypressed(key,scancode,isrepeat)
	if key=="w" then
		self.op = (self.op-1)%(#options)
	elseif key=="s" then
		self.op = (self.op+1)%(#options)
	elseif key=="space" then
		state = self.op+1
		if state==5 then
			love.event.quit()
		end
	end
end

function Menu:draw()
	initDrawText("BREAKOUT",150,50)
	drawText(options,self.X,self.Y,self.gap,25)
	love.graphics.rectangle("fill",self.X-2*self.size,self.Y+self.op*self.gap,self.size,self.size)
end