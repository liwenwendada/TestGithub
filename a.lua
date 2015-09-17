--[[
print("test")
a=10
print(a)
print(b)

a="qwer"
print(a)
--]]

--测试类型
--[[
print(type("hello")) --string
print(type(12.3))   --number
print(type(print))  --function
print(type(true))   --boolean,false和nil为假，其他都为真
print(type(nil))    --nil
print(type(type("a"))) --string
--]]

--可以把函数赋值给变量，这样变量也具有函数功能
--a=print
--a("name")


--将a中的one替换成another
--[[
a="one string"
b=string.gsub(a,"one","another")
print(a,b)
--]]


--编译器可以讲string类型的数字自动转换成number
--[[
print("10"+1) --11
print("10+1") --10+1
print("10"+"1") --11
print("hello".."world")--连接运算符,helloworld
print("10"..20)--将20也转成字符串 ,1020
print(10 ..20)--有空格,1020
--报错print("hello"+1)
--]]

--将字符串转换成数字
--[[
m="AA"
print(tonumber(m)) --tostring类似tonumber
if tonumber(m) then
	print("Success")
else
	a=50;--这里是全局变量，如果加上local，下面就无法打印了
	print("Fail")
end
print(a)

--逻辑运算符
print(4 and 5) --5
print(nil and 13) --nil
print(false and 13) --false
print(4 or 5) --4
print(false or 5) --5
--(a and b)or c相当于a?b:c
--优先级：算术>关系>逻辑

--交换两个变量的值
a,b,c=20,30
a,b=b,a
print(a,b,c)
--]]

--[[
--for循环
for i=1,100,3 do  --3是梯度，即i=i+3
	print(i)
end

--while循环
local x = 1
while true  do
	x=x+1
	print(x)
	if x==50 then
		break;
	end
end
--]]


-- function max( a,b )
-- 	if a>b then
-- 		return a
-- 	else
-- 		return b
-- 	end
-- end
-- print(max(10,20,30,40)) --20,多余的自动忽略


--拥有多个返回值的函数，如果不是放在最后一个的话，
--它只返回一个值，只有放在最后一个才返回多个返回值
-- function test(...)
-- 	return 10,20,30 
-- end
-- a,b,c,d,e=test(),50,50 --10 50 50 nil nil
-- print(a,b,c,d,e)       
-- a,b,c,d,e=50,50,test() --50 50 10 20 30
-- print(a,b,c,d,e)


-- function A()
-- 	function B()
-- 		print("B called")
-- 	end 
-- 	B()
-- 	print("A called")
-- end
-- A()
-- B()

-- days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}
-- print(days[3]) --Tuesday，Lua中所有下标都是从1开始的
-- for i,j in ipairs(days) do
-- 	print(i,j)
-- end

-- config={name="zhangsan",age=20} --name键，不可以加引号；值可以加引号
-- --print(config.name)
-- --print(config["name"])
-- config.sex="boy"
-- --print(config.sex)
-- --config["sex"]="boy"
-- --遍历
-- for i,j in pairs(config) do  --i,j代表的是键值对
-- 	print(i,j)
-- end


-- arr={}
-- for var=1,100 do 
-- 	table.insert(arr,1,var)--因为每次是在首位置插入，所以顺序是100,...，1
-- end
-- for i,j in pairs(arr) do
-- 	print(i,j)
-- end
-- print(#arr) --打印的是元素个数
-- print(table.maxn(arr))


--ipairs则不能返回nil,只能 返回数字0,如果遇到nil则退 出。
--ipairs只能遍历到表中出现的第一个不是整数的key
--pairs可以遍历表中所有的 key,并且除了迭代器本身以及遍历表本身还可以返回nil;

-- config={name="Tom",age=13,[2]="apple",[1]="banana",[4]="oringe"}
-- for k,v in ipairs(config) do
-- 	print(k,v)
-- end  
--[[
输出结果：
1	banana
name	Tom
2	apple
4	oringe
age	13
--]]
--[[
config={name="Tom",age=13,[2]="apple",[1]="banana",[4]="oringe"}
for k,v in ipairs(config) do
	print(k,v)
end
输出结果：
1	banana
2	apple
--]]

--闭合函数
-- function count()
-- 	local i = 1
-- 	return function ()
-- 		i=i+1
-- 		return i
-- 	end
-- end
-- local fun = count()
-- print(fun())--fun是函数名，打印的是函数地址，fun()是函数
-- print(fun())
-- print(fun())

--非全局函数,存储在局部变量中的函数称为非全局函数
-- local function test()
-- end
-- --相当于
-- local test
-- test=function ()
-- end

--尾调用的时候,该函数也就意味着结束了,不需要保存任何关于该函数的栈信息,
--因此可以拥有无数嵌套尾调用。尾调用主要用来实现状态机等操作。节省时间
-- local eat
-- local drink
-- eat=function()
-- 	print("eat")
-- 	return drink() --return drink()+1,就不是尾调用
-- end
-- drink=function()
-- 	return 10
-- end
-- for i=1,10000 do
-- 	eat()
-- end

-- function diedaiqi(t)
-- 	local i=0
-- 	return function()
-- 		i=i+1
-- 		return t[i]
-- end
-- end
-- local t ={"a","b","c","d"}
-- local iter = diedaiqi(t)
-- while true do
-- 	local value=iter()
-- 	if value==nil then
-- 		break;
-- 	end
-- 	print(value)
-- end

--返回两个值的迭代器
-- function dieDaiQi(t)
-- 	local i=0;
-- 	return function ()
-- 		i=i+1
-- 		if i> #t then
-- 			return nil
-- 		end
-- 		return i,t[i]
-- 	end
-- end

-- local t = {"fdsd","455","999"}
-- for k,v in dieDaiQi(t) do
-- 	print(k .. "," ..v)
-- end

--调用error函数就会显示函数错误信息
-- error("出错了")
-- local name="zhangsan1"
-- if name~="zhangsan" then 
-- error("一个巴掌佛过来")
-- end
--相当于下面多函数
-- local name = "张三1"
-- -- --如果成功返回true，不成功返回错误信息
-- local result=assert(name=="张三","你不是张三，老子就是一个巴掌佛过来")
-- print(result)
--使用pcall调用test函数,如果test不报错,
--则pcall返回ture,否则,返回 false。
--pcall除了会返回true或 者false外,还能返回函数的错误信息
function test()
	print(a[1])
end
local status,err=pcall(test)
if status then
	print("Ok")
	else
		print("error")
		print(err)
	end






