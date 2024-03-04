Stats = {}

function Stats:load()
	self.top = Highscore.highscores[1]
	self.score = 0
	self.level = 0
	self.life = 3
	self.on = false
end

function Stats:levelup()
	self.level = self.level+1
end

function Stats:loselife()
	self.life = self.life-1
end

function Stats:onoff()
	self.on = not self.on
end

function Stats:earnscore(d)
	self.score = self.score+d
end

function Stats:isdead()
	return self.life==0
end

function Stats:draw()
	love.graphics.setFont(love.graphics.newFont(15))
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("TOP : "..tostring(self.top),0,0)
	love.graphics.print("SCORE : "..tostring(self.score),0,15)
	love.graphics.print("LEVEL : "..tostring(self.level),0,30)
	love.graphics.print("LIFES : "..tostring(self.life),0,45)
end