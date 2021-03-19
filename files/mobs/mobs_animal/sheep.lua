local colors = {
	{"black",		"#000000b0"},
	{"blue",		"#015dbb70"},
	{"brown",		"#663300a0"},
	{"cyan",		"#01ffd870"},
	{"dark_green",	"#005b0770"},
	{"dark_grey",	"#303030b0"},
	{"green",		"#61ff0170"},
	{"grey",		"#5b5b5bb0"},
	{"magenta",		"#ff05bb70"},
	{"orange",		"#ff840170"},
	{"pink",		"#ff65b570"},
	{"red",			"#ff0000a0"},
	{"violet",		"#2000c970"},
	{"white",		"#abababc0"},
	{"yellow",		"#e3ff0070"}
}

-- Sheep by PilzAdam, texture converted to minetest by AMMOnym from Summerfield pack
for _, col in pairs(colors) do
	mobs:register_mob("mobs_animal:sheep_" .. col[1], {
		stay_near = {"farming:straw", 10},
		type = "animal",
		passive = true,
		hp_min = 6,
		hp_max = 10,
		collisionbox = {-0.4, -1, -0.4, 0.4, 0.3, 0.4},
		visual = "mesh",
		mesh = "mobs_sheep.b3d",
		textures = {"mobs_sheep_base.png^(mobs_sheep_wool.png^[colorize:" .. col[2] .. ")"},
		gotten_texture = {"mobs_sheep_base.png^mobs_sheep_shaved.png"},
		gotten_mesh = "mobs_sheep_shaved.b3d",
		makes_footstep_sound = true,
		sounds = {
			random = "mobs_sheep",
			damage = "mobs_sheep_angry"
		},
		runaway = true,
		jump_height = 3,
		drops = function(pos)
			if rawget(_G, "experience") then
				experience.add_orb(math.random(2, 4), pos)
			end
			return {
				{name = "mobs:meat_raw"},
				{name = "mobs:meat_raw", chance = 2},
				{name = "wool:"..col[1]}
			}
		end,
		animation = {
			speed_normal = 15,	speed_run = 15,
			stand_start = 0,	stand_end = 80,
			walk_start = 81,	walk_end = 100
		},
		fear_height = 3,
		follow = {"flora", "farming:wheat"},
		replace_rate = 10,
		replace_what = {
			{"group:flora", "air", -1},
			{"default:dirt_with_grass", "default:dirt", -2}
		},

		on_replace = function(self)
			self.food = (self.food or 0) + 1

			-- if the sheep replaces 8x grass, it will regrow wool
			if self.food >= 8 and self.gotten then
				self.food = 0
				self.gotten = false

				self.object:set_properties({
					textures = {"mobs_sheep_base.png^(mobs_sheep_wool.png^[colorize:" .. col[2] .. ")"},
					mesh = "mobs_sheep.b3d"
				})
			end
		end,

		on_rightclick = function(self, clicker)
			-- feed or tame
			if mobs:feed_tame(self, clicker, 8, true, true) then
				-- if feed 7x, the sheep regrow wool
				if self.food and self.food > 6 then
					self.gotten = false
					self.object:set_properties({
						textures = {"mobs_sheep_base.png^(mobs_sheep_wool.png^[colorize:" .. col[2] .. ")"},
						mesh = "mobs_sheep.b3d"
					})
				end
				return
			end

			local item = clicker:get_wielded_item()
			local itemname = item:get_name()
			local player = clicker:get_player_name()
			local pos = self.object:get_pos()

			-- haircut
			if itemname == "mobs:shears"
					and not self.gotten
					and not self.child
					and self.tamed
					and player == self.owner then
				minetest.item_drop(
					ItemStack("wool:" .. col[1] .. " " .. math.random(3)), nil, pos)
				item:add_wear(65535/100) -- 100 uses
				clicker:set_wielded_item(item)
				self.object:set_properties({
					textures = {"mobs_sheep_base.png^mobs_sheep_shaved.png"},
					mesh = "mobs_sheep_shaved.b3d"
				})
				self.gotten = true -- shaved
				return
			end

			-- coloring
			if itemname:find("dye:")
					and not self.gotten
					and not self.child
					and self.tamed
					and player == self.owner then
				local color = itemname:split(":")[2]

				if col[1] == color then return end
				local mob = minetest.add_entity(pos, "mobs_animal:sheep_" .. color)
				local infotext, nametag = self.infotext or "", self.nametag or ""
				self.object:remove()
				local ent = mob:get_luaentity()
				ent.object:set_properties({
					infotext = infotext,
					nametag = nametag
				})
				ent.infotext = infotext
				ent.nametag = nametag
				ent.owner = player
				ent.tamed = true

				-- take item
				if not mobs.is_creative(player) or
						not minetest.is_singleplayer() then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				return
			end
		--	if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end
		end
	})
end

mobs:register_egg("mobs_animal:sheep_white", mobs_animal.S"Sheep", "mobs_sheep_egg.png")

mobs:spawn({
	name = "mobs_animal:sheep_white",
	mobs_animal.spawn_nodes,
	min_light = 7,
	chance = 100000,
	min_height = 0,
	day_toggle = true
})

mobs:spawn({
	name = "mobs_animal:sheep_grey",
	mobs_animal.spawn_nodes,
	min_light = 7,
	chance = 100000,
	min_height = 0,
	day_toggle = true
})

mobs:spawn({
	name = "mobs_animal:sheep_dark_grey",
	mobs_animal.spawn_nodes,
	min_light = 7,
	chance = 100000,
	min_height = 0,
	day_toggle = true
})

local nodes = {"default:dirt", "default:sand", "default:redsand", "default:dirt_with_dry_grass", "default:dirt_with_grass"}

mobs:spawn({
	name = "mobs_animal:sheep_black",
	nodes = nodes,
	min_light = 7,
	chance = 100000,
	min_height = 0,
	day_toggle = true
})

mobs:spawn({
	name = "mobs_animal:sheep_brown",
	nodes = nodes,
	min_light = 7,
	chance = 100000,
	min_height = 0,
	day_toggle = true
})
