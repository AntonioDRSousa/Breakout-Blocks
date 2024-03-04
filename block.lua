Block = {}
Block.__index = Block

blocks = {}

colors = {{1,0,0},{1,0.5,0},{0,1,0},{0,1,1},{0,0,1},{1,0,1},{1,1,0},{1,0,0.5}}

function Block.new(i, j)
	b = setmetatable({}, Block)
	
	b.px = i
	b.py = j
	
	b.width = 50
	b.height = 20
	b.x = i*b.width
	b.y = 100+j*b.height

	b.color = colors[j+1]
	
	table.insert(blocks,b)
end

function Block:draw()
	love.graphics.setColor(self.color[1], self.color[2], self.color[3])
	love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle( "line", self.x,self.y,self.width,self.height,1,1)
end

function Block.drawAll()
	for i,b in ipairs(blocks) do
		b:draw()
	end
end

function Block:createBlocks()
	Block:removeAll()
	for i=0,11,1 do
		for j=0,7,1 do
			Block.new(i,j)
		end
	end
end

function Block:removeAll()
	for i in pairs(blocks) do
		blocks[i] = nil
	end
end