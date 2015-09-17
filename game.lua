--简单的模块
local game={}
game.play=function()
print("Play")
end

game.stop=function ()
	print("stop")
end

function game.pause()
	print("pause")
end
return game



