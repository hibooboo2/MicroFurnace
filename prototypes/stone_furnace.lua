local stone_micro_furnace = {
	type = "stone",
	entity = function(d)
		local name = d.name
		local tier = d.tier

		return {
			type = "furnace",
			name = name,
		  icons = {{icon = "__base__/graphics/icons/stone-furnace.png", tint = tier.color}},
			icon_size = 32,
			flags = {"placeable-neutral", "placeable-player", "player-creation"},
			minable = {mining_time = 5, result = name},
			max_health = 200,
			corpse = "medium-remnants",
			repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
			mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
			open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
			close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
			working_sound =
			{
				sound = { filename = "__base__/sound/furnace.ogg", }
			},
			resistances =
			{
				{
					type = "fire",
					percent = 90
				},
				{
					type = "explosion",
					percent = 30
				},
				{
					type = "impact",
					percent = 30
				}
			},
			collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
		  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		  crafting_categories = {"smelting", "micro-furnace-smelting"},
			result_inventory_size = 1,
			crafting_speed = tier.multiplier * 48,
		  energy_usage = tier.multiplier * 180 * 48 .. "kW",
			source_inventory_size = 1,
			energy_source =
			{
				type = "burner",
				fuel_category = "chemical",
				effectivity = 1,
				fuel_inventory_size = 1,
				emissions = 0.01,
				smoke =
				{
					{
						name = "smoke",
						deviation = {0.1, 0.1},
						frequency = 5*24*tier.multiplier,
						position = {0.0, -0.8},
						starting_vertical_speed = 0.08,
						starting_frame_deviation = 60
					}
				}
			},
			animation =
			{
			layers =
				{
					{
					filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
					priority = "extra-high",
					width = 81,
					height = 64,
					frame_count = 1,
					shift = {0.515625, 0.0625},
					tint = tier.color,
					hr_version =
					{
						filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace.png",
						priority = "extra-high",
						width = 151,
						height = 146,
						frame_count = 1,
						shift = util.by_pixel(-0.25, 6),
						tint = tier.color,
						scale = 0.5
						}
					},
					{
					filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
					priority = "extra-high",
					width = 81,
					height = 64,
					frame_count = 1,
					draw_as_shadow = true,
					shift = {0.515625, 0.0625},
					hr_version =
					{
						filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-shadow.png",
						priority = "extra-high",
						width = 164,
						height = 74,
						frame_count = 1,
						draw_as_shadow = true,
						shift = util.by_pixel(14.5, 13),
						scale = 0.5
						}
					}
				}
			},
			working_visualisations =
				{
					{
						north_position = {0.0, 0.0},
						east_position = {0.0, 0.0},
						south_position = {0.0, 0.0},
						west_position = {0.0, 0.0},
						animation =
						{
							filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
							priority = "extra-high",
							line_length = 8,
							width = 20,
							height = 49,
							frame_count = 48,
							axially_symmetrical = false,
							direction_count = 1,
							shift = util.by_pixel(2, 5.5),
							hr_version =
					{
								filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-fire.png",
								priority = "extra-high",
								line_length = 8,
								width = 41,
								height = 100,
								frame_count = 48,
								axially_symmetrical = false,
								direction_count = 1,
								shift = util.by_pixel(-0.75, 5.5),
								scale = 0.5
							}
						},
					light = {intensity = 1, size = 1, color = {r=1.0, g=1.0, b=1.0}}
					}
				},
			fast_replaceable_group = "furnace"
		}
	end,
	item = function(d)
		local name  = d.name
		local order = "c[micro-furnace]-"..d.order
		local tier  = d.tier
	  
		return {
		  type = "item",
		  name = name,
		  icons = {{icon = "__base__/graphics/icons/stone-furnace.png", tint = tier.color}},
		  icon_size = 32,
		  flags = {"goes-to-quickbar"},
		  order = order,
		  subgroup = "smelting-machine",
		  place_result = name,
		  stack_size = 10
		}
	end,
	recipe = function(d)
		local multiplier = d.tier.multiplier
		local recipe = {
			type = "recipe",
			category = "crafting",
			name = d.name,
			normal = {
			  enabled = false,
			  ingredients = {
				{"stone-furnace", 48 * multiplier},
				{"loader", 2 * multiplier},
				{"iron-plate", 20 * multiplier},
				{"electronic-circuit", 10 * multiplier},
				{"iron-gear-wheel", 10 * multiplier },
				{"iron-stick", 10 * multiplier },
			  },
			  energy_required = 30,
			  result = d.name,
			},
			expensive = {
			  enabled = false,
			  ingredients = {
				{"stone-furnace", 48 * 2 * multiplier},
				{"loader", 2 * 2 * multiplier},
				{"iron-plate", 20 * 2 * multiplier},
				{"electronic-circuit", 10 * 2 * multiplier},
				{"iron-gear-wheel", 10 * 2 * multiplier },
				{"iron-stick", 10 * 2 * multiplier },
			  },
			  energy_required = 120,
			  result = d.name,
			},
		  }
		  return recipe
	end,
	technology = function(d)
		local function getIngredients()
			if d.tier.multiplier == 4 then
				return d.raw.technology["bob-logistics-4"].unit.ingredients
			end
			if d.tier.multiplier == 5 then
				return d.raw.technology["bob-logistics-5"].unit.ingredients
			end
			if d.tier.multiplier == 1 then
				return {
					{"science-pack-1", 1},
				}
			end
			if d.tier.multiplier == 2 then
				return {
					{"science-pack-1", 1},
					{"science-pack-2", 1},
				}
			end
			return {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
			}
		end
		local tech =  {
			type = "technology",
			name = d.name,
			icon_size = 128,
			icon = "__base__/graphics/technology/advanced-material-processing.png",
			effects = {{type = "unlock-recipe", recipe = d.name }},
			prerequisites = {"loader"},
			unit = {
			  count = 50,
			  time = 30,
			  ingredients = getIngredients(d),
			},
			order = "c-d-"..d.order,
		  }
		for i=0,d.tier.multiplier-2 do
			tech.unit.count = tech.unit.count * 2
		end
		return tech
	end,
}

return stone_micro_furnace