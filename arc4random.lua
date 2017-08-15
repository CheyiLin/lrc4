--[[
	arc4random - Pure Lua/LuaJIT arc4random pseudo-random number generator
	Part of lrc4 - Pure Lua/LuaJIT RC4 stream cipher library - https://github.com/CheyiLin/lrc4

	The MIT License (MIT)

	Copyright (c) 2017 Soni L. <soniex2 at gmail dot com>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]

local rc4 = require "rc4"
local string_byte = string.byte

local next_byte = function(st)
	return string_byte(st('\0'))
end
local make_rng = function(m, seed)
	local st = rc4(seed)
	return function() return next_byte(st) end
end

return setmetatable({}, {__call=make_rng, __metatable=false})
