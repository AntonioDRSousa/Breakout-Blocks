Help = {}

hlp = {"* You earn points when ball collide in a block.",
       "* Information : ",
	   "  -> 'Top' is the highest score earned in this game.",
	   "  -> 'Score' score earned in this game.",
	   "  -> 'Life' is the number of changes until game end.",
	   "  -> 'Level' is level in this game.",
	   "* The game begin paused. A ball in begin go in direction to paddle.",
	   "* Elements of Game: ",
	   "  -> A Paddle controlled by player",
	   "  -> 8 rows each with 12 Blocks",
	   "  -> A Ball that moves",
       "* Paddle make ball change move.",
	   "* When all blocks are destroyed,",
	   "  you levelup, and all blocks are respawn.",
	   "* Score are calculated by (8-y)X(level+1)",
	   "  y -> row of block(0 to 7 in up to down)",
	   "* If ball move to down of screen, you lose 1 life, and ball respawn in standard location.",
	   "* When you have 0 life, the game end."
      }

function Help:load()
	
end

function Help:draw()
	initDrawText("Help",150,50)
	drawText(hlp,100,200,20,10)
end