local modpath = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local newWR = dofile(modpath .. "weighted.lua")

local categories = {}


local function get_or_make_cat(category)

	if categories[category] ~= nil then
		return categories[category]
	else
		local newCat = newWR()
		categories[category] = newCat
		return newCat
	end
end


loot = {}

-- Format:
--
-- { weights = { generic = 100 }, -- Likeliness per category
--                                -- Diamond is 100
--   payload = { stack = <ItemStack>,
--               min_size = 1, -- optional 
--               max_size = 10, -- optional
--             },
-- }


loot.register_loot = function(def)
	for c_name, weight in pairs(def.weights) do
		local cat = get_or_make_cat(c_name)
		cat:add(def.payload, weight)
	end
end


local function payload_to_stack(pl)
	local min, max = pl.min_size, pl.max_size
	local stack = ItemStack(pl.stack)

	if min and max then
		stack:set_count(math.random(min, max))
	end

	return stack
end


-- loot.generate_loot(cat, count) generates count ItemStacks from the loot
-- category cat and returns them as a list.
loot.generate_loot = function(category, count)
	local cat = get_or_make_cat(category)
	local pls = cat:get(count)

	for i, pl in ipairs(pls) do
		pls[i] = payload_to_stack(pl)
	end

	return pls
end


loot.modpath = modpath

local vaults = minetest.setting_getbool("loot_vaults")
local dungeon_loot = minetest.setting_getbool("loot_dungeons")
if dungeon_loot == nil then dungeon_loot = true end -- default dungeon loot to true

dofile(modpath .. "default_loot.lua")

dofile(modpath .. "loot_node.lua")
if vaults then dofile(modpath .. "loot_vault.lua") end
if dungeon_loot then dofile(modpath .. "dungeon.lua") end

