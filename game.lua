--简单的模块
local game={}
game.play=function()
print("Play")
end

--测试下载功能
--别人修改了一些东西，我需要更新
game.stop=function ()
	print("stop")
end

function game.pause()
	print("pause")
end
return game



