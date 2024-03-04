require("paddle")
require("ball")
require("block")
require("stats")

Breakout = {}

function Breakout:load()
	Stats:load()
	Paddle:load()
	Ball:load()
	Block:createBlocks()
end

function Breakout:keypressed(key,scancode,isrepeat)
	if key=="p" then
		Stats:onoff()
	elseif key=="b" then
		Highscore:check(Stats.score)
		state = 5
	end
end

function Breakout:update(dt)
	if Stats.on then
		Paddle:update(dt)
		Ball:update(dt)
		if Stats:isdead() then
			Highscore:check(Stats.score)
			state=5
		end
	end
end

function Breakout:draw()
	Paddle:draw()
	Ball:draw()
	Block.drawAll()
	Stats:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill",0,60,love.graphics.getWidth(),10)
end

function checkCollision(a, b)
   return a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height
end