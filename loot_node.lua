
-- Node that turns into a chest containing some loot
minetest.register_node("loot:loot_node",
	{ drawtype = "airlike",
	  pointable = false,
	  walkable = false,
	  diggable = false,
})


minetest.register_abm({
	nodenames = {"loot:loot_node"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.remove_node(pos)
		minetest.place_node(pos, {name = "default:chest"})
		local inv = minetest.get_meta(pos):get_inventory()

		local valuable_count = math.random(1,3)
		local generic_count = math.random(0,5)

		local valuables = loot.generate_loot("valuable", valuable_count)
		local loots = loot.generate_loot("generic", generic_count)

		for i, v in ipairs(valuables) do
			table.insert(loots,v)
		end

		inv:set_list("main", loots)
	end,
})

