-- Creates loot vaults

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
