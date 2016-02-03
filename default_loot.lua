loot.register_loot(
	{ weights = { generic = 50 },
	  payload = { stack = ItemStack("default:acacia_sapling") },
})

loot.register_loot(
	{ weights = { generic = 200 },
	  payload = { stack = ItemStack("default:apple"),
		      min_size = 1,
		      max_size = 20,
		    },
})

loot.register_loot(
	{ weights = { generic = 500 },
	  payload = { stack = ItemStack("default:copper_ingot"),
		      min_size = 1,
		      max_size = 10,
		    },
})

loot.register_loot(
	{ weights = { generic = 500 },
	  payload = { stack = ItemStack("default:copper_lump"),
		      min_size = 1,
		      max_size = 10,
		    },
})


loot.register_loot(
	{ weights = { generic = 100,
		      valuable = 100, },
	  payload = { stack = ItemStack("default:diamond"),
		      min_size = 1,
		      max_size = 5,
		    },
})

loot.register_loot(
	{ weights = { generic = 200,
		      valuable = 200, },
	  payload = { stack = ItemStack("default:gold_ingot"),
		      min_size = 1,
		      max_size = 10,
		    },
})

loot.register_loot(
	{ weights = { generic = 200,
		      valuable = 200, },
	  payload = { stack = ItemStack("default:gold_lump"),
		      min_size = 1,
		      max_size = 5,
		    },
})

loot.register_loot(
	{ weights = { generic = 500 },
	  payload = { stack = ItemStack("default:steel_ingot"),
		      min_size = 1,
		      max_size = 10,
		    },
})

loot.register_loot(
	{ weights = { generic = 500 },
	  payload = { stack = ItemStack("default:iron_lump"),
		      min_size = 1,
		      max_size = 10,
		    },
})

loot.register_loot(
	{ weights = { generic = 200,
		      valuable = 200, },
	  payload = { stack = ItemStack("default:mese_crystal"),
		      min_size = 1,
		      max_size = 20,
		    },
})

loot.register_loot(
	{ weights = { generic = 20,
		      valuable = 20, },
	  payload = { stack = ItemStack("default:mese"),
		      min_size = 1,
		      max_size = 5,
		    },
})

loot.register_loot(
	{ weights = { generic = 100 },
	  payload = { stack = ItemStack("default:obsidian"),
		      min_size = 1,
		      max_size = 30,
		    },
})

if not minetest.get_modpath("farming") then return end

loot.register_loot(
	{ weights = { generic = 200 },
	  payload = { stack = ItemStack("farming:bread"),
		      min_size = 1,
		      max_size = 50,
		    },
})

loot.register_loot(
	{ weights = { generic = 200 },
	  payload = { stack = ItemStack("farming:seed_cotton"),
		      min_size = 1,
		      max_size = 50,
		    },
})

loot.register_loot(
	{ weights = { generic = 200 },
	  payload = { stack = ItemStack("farming:seed_wheat"),
		      min_size = 1,
		      max_size = 50,
		    },
})
