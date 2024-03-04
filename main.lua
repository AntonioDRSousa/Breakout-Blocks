require("breakout")
require("menu")
require("controls")
require("highscore")
require("help")
require("gameover")

state = 0

function love.load()
	Highscore:load()
	Menu:load()
	Breakout:load()
	Controls:load()
	Help:load()
	Game_Over:load()
end

function love:keypressed(key,scancode,isrepeat)
	if key=="q" then
		love.event.quit()
	else
		if state==0 then
			Menu:keypressed(key,scancode,isrepeat)
		elseif state==1 then
			Breakout:keypressed(key,scancode,isrepeat)
		else
			keypressed_main(key,scancode,isrepeat)
		end
	end
end

function love.quit()
	Highscore:write()
end

function love.update(dt)
	if state==1 then
		Breakout:update(dt)
	end
end

function love.draw()
	if state==0 then
		Menu:draw()
	elseif state==1 then
		Breakout:draw()
	elseif state==2 then
		Highscore:draw()
	elseif state==3 then
		Controls:draw()
	elseif state==4 then
		Help:draw()
	elseif state==5 then
		Game_Over:draw()
	end
end

function keypressed_main(key,scancode,isrepeat)
	if key=="space" then
		Breakout:load()
		state = 0
	end
end

function initDrawText(title,x,y)
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
	love.graphics.setColor(1,1,1)
	love.graphics.setFont(love.graphics.newFont(50))
	love.graphics.print(title,x,y)
end

function drawText(v,x0,y0,d,nf)
	love.graphics.setFont(love.graphics.newFont(nf))
	for i,s in ipairs(v) do
		love.graphics.print(s,x0,y0+(i-1)*d)
	end
end