Game_Over = {}

function Game_Over:load()
	
end

function Game_Over:draw()
	initDrawText("GAME END",150,50)
	love.graphics.print("Score : "..tostring(Stats.score),0,200)
	love.graphics.print("Top : "..tostring(Stats.top),0,300)
	love.graphics.print("Level : "..tostring(Stats.level),0,400)
end