-- Creates loot vaults


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
		local generic_count = math.random(0,10)

		local valuables = loot.generate_loot("valuable", valuable_count)
		local loots = loot.generate_loot("generic", generic_count)

		for i, v in ipairs(valuables) do
			table.insert(loots,v)
		end

		inv:set_list("main", loots)
	end,
})


local mts = loot.modpath .. "loot_vault.mts"

minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y < -10 then return end
	local do_gen = seed % 131 == 0

	if not do_gen then return end

	local face = tostring((seed % 4) * 90)

	local candidates =
		minetest.find_nodes_in_area_under_air(minp, maxp, "group:soil")

	local choice = candidates[1]

	if not choice then return end

	local base = vector.add(choice, {x=-7, y=-13, z=-7})

	minetest.log("action",
		     "Generating loot vault at " .. minetest.pos_to_string(base))

	minetest.place_schematic(base,
				 mts,
				 face,
				 { ["default:chest"] = "loot:loot_node" },
				 true)

end)

minetest.set_gen_notify("dungeon")

minetest.register_on_generated(function(minp, maxp, blockseed)

		local notif = minetest.get_mapgen_object("gennotify")

		if not notif then return end

		local locations = notif.dungeon

		if not locations then return end

		for i, location in ipairs(locations) do
			if math.random(3) == 1 then
				minetest.place_node(location, { name = "loot:loot_node" })
			end
		end
end)
