
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
