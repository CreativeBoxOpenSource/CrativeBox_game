--
-- Doors
--

-- Apple Wood Doors --

doors.register("door_wood", {
	tiles = {{name = "doors_door_wood.png", backface_culling = true}},
	description = "Apple Wood Door",
	inventory_image = "doors_item_wood.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	fuel = 14,
	recipe = {
		{"default:wood", "default:wood"},
		{"default:wood", "default:wood"},
		{"default:wood", "default:wood"}
	}
})

-- Acacia Wood Doors --

doors.register("door_acacia_wood", {
	tiles = {{name = "doors_door_acacia_wood.png", backface_culling = true}},
	description = "Acacia Wood Door",
	inventory_image = "doors_item_acacia_wood.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	fuel = 14,
	recipe = {
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"},
		{"default:acacia_wood", "default:acacia_wood"}
	}
})

-- Birch Wood Doors --

doors.register("door_birch_wood", {
	tiles = {{name = "doors_door_birch_wood.png", backface_culling = true}},
	description = "Birch Wood Door",
	inventory_image = "doors_item_birch_wood.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	fuel = 14,
	recipe = {
		{"default:birch_wood", "default:birch_wood"},
		{"default:birch_wood", "default:birch_wood"},
		{"default:birch_wood", "default:birch_wood"}
	}
})

-- Jungle Wood Doors --

doors.register("door_jungle_wood", {
	tiles = {{name = "doors_door_jungle_wood.png", backface_culling = true}},
	description = "Jungle Wood Door",
	inventory_image = "doors_item_jungle_wood.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	fuel = 14,
	recipe = {
		{"default:junglewood", "default:junglewood"},
		{"default:junglewood", "default:junglewood"},
		{"default:junglewood", "default:junglewood"}
	}
})

-- Pine Wood Doors --

doors.register("door_pine_wood", {
	tiles = {{name = "doors_door_pine_wood.png", backface_culling = true}},
	description = "Pine Wood Door",
	inventory_image = "doors_item_pine_wood.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	fuel = 14,
	recipe = {
		{"default:pine_wood", "default:pine_wood"},
		{"default:pine_wood", "default:pine_wood"},
		{"default:pine_wood", "default:pine_wood"}
	}
})


-- Other Doors --

doors.register("door_steel", {
	tiles = {{name = "doors_door_steel.png", backface_culling = true}},
	description = "Steel Door",
	inventory_image = "doors_item_steel.png",
	protected = true,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"}
	}
})

minetest.register_alias("doors:hidden", "air")

--
-- Trapdoors
--

doors.register_trapdoor("doors:trapdoor", {
	description = "Apple Wood Trapdoor",
	wield_image = "doors_trapdoor_wood.png^doors_trapdoor_wood_handle.png",
	tile_front = "doors_trapdoor_wood.png^doors_trapdoor_wood_handle.png",
	tile_bottom = "doors_trapdoor_wood.png",
	tile_side = "doors_trapdoor_wood_side.png",
	material = "default:wood",
	fuel = 7,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1}
})

doors.register_trapdoor("doors:trapdoor_steel", {
	description = "Steel Trapdoor",
	wield_image = "doors_trapdoor_steel.png^doors_trapdoor_steel_handle.png",
	tile_front = "doors_trapdoor_steel.png^doors_trapdoor_steel_handle.png",
	tile_bottom = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	node_box_open = {
		type = "fixed",
		fixed = {-0.5, -0.5, 3/8, 0.5, 0.5, 0.5}
	},
	node_box_close = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -3/8, 0.5}
	},
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	material = "default:steel_ingot",
	groups = {cracky = 1, level = 2, door = 1}
})

--
-- Fencegates
--

doors.register_fencegate("doors:gate_wood", {
	description = "Apple Wood Fence Gate",
	texture = "default_wood.png",
	inventory_image = "doors_fencegate_wood.png",
	wield_image = "doors_fencegate_wood.png",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, fencegate_wood = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:fencegate_wood",
	burntime = 10
})

