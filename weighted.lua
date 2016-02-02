-- Weighted randomness.

local function add(self, value, weight)
	self.size = self.size + weight
	table.insert(self, { value = value,
			     weight = weight,
	})
end


local function get(self, count)

	if count == nil then count = 1 end
	
	local max = self.size

	if max == 0 then return {} end
	
	local nums = {}
	local random = math.random

	for i = 1, count do
		table.insert(nums, random(max))
	end

	table.sort(nums)

	local result = {}

	local numI = 1
	local elemI = 1

	local curNum = nums[numI]
	local curElem = self[elemI]

	local pos = curElem.weight

	while curNum ~= nil and curElem ~= nil do

		if curNum <= pos then
			table.insert(result, curElem.value)
			numI = numI + 1
			curNum = nums[numI]
		else
			elemI = elemI + 1
			curElem = self[elemI]
			
			pos = pos + curElem.weight
		end
	end

	return result
end


local methods = { add = add,
		  get = get,
}


local function newWRandom()
	local wr = { size = 0 }
	setmetatable(wr, { __index = methods })
	return wr
end


return newWRandom
