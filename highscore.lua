Highscore = {}

function Highscore:load()
	Highscore:read()
end

function Highscore:read()
	local file = io.open("highscores/highscores.num","r")
	self.highscores = {}
	for x in file:lines() do
		table.insert(self.highscores,tonumber(x))
	end
end

function Highscore:write()
	file = io.open("highscores/highscores.num","w")
	for i,x in ipairs(self.highscores) do
		file:write(tostring(x),"\n")
	end
end

function Highscore:check(value)
	table.insert(self.highscores,value)
	table.sort(self.highscores,function(x,y) return x>y end)
	table.remove(self.highscores,11)
end

function Highscore:draw()
	initDrawText("HIGHSCORE",150,50)
	love.graphics.setFont(love.graphics.newFont(25))
	for i,x in ipairs(self.highscores) do
		love.graphics.print(tostring(i).." - "..tostring(x),0,50+i*50)
	end
end