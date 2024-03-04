Controls = {}

cont = {"<a> : move paddle to left",
        "<d> : move paddle to left",
		"<q> : quit game",
		"<p> : pause and unpase",
		"<b> : back to menu",
		"<space> : confirm in menu, help, game end, controls, highscores.",
		"<w> : go up in menu options.",
		"<s> : go down in menu options."
       }

function Controls:load()
	
end

function Controls:draw()
	initDrawText("CONTROLS",150,50)
	drawText(cont,0,200,50,25)
end