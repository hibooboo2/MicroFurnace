local electric_micro_furnace = {
	type = "electric",
	entity = function(data)
		local name = data.name
		local tier = data.tier

		return {
		  type = "assembling-machine",
		  name = name,
		  icons = {{icon = "__base__/graphics/icons/electric-furnace.png", tint = tier.color}},
		  icon_size = 32,
			flags = {"placeable-neutral", "placeable-player", "player-creation"},
		  minable = {mining_time = 5, result = name},
		  max_health = 500,
		  corpse = "big-remnants",
		  dying_explosion = "medium-explosion",
		  light = {intensity = 1, size = 8},
		  resistances = {
			{type = "fire",     percent = 80},
			{type = "acid",     percent = 80},
			{type = "physical", percent = 60},
		  },
		  collision_box = {{-0.25, -0.25}, {0.25, 0.25}},
		  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		  module_specification = {module_slots = tier.module_slots, module_info_icon_shift = {0, 0.8}},
		  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		  crafting_categories = {"smelting", "micro-furnace-smelting"},
		  fast_replaceable_group = "furnace",
		  ingredient_count = 4,
		  crafting_speed = tier.multiplier * 2 * 24,
		  energy_usage = tier.multiplier * 180 * 30 .. "kW",
		  energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.005,
		  },
		  vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
		  working_sound = {
			sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.7},
			apparent_volume = 1.5
		  },
		  animation = {
			layers =
			  {
				{
				  filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
				  priority = "high",
				  width = 129,
				  height = 100,
				  frame_count = 1,
				  shift = {0.421875/3, 0},
				  scale = 1/3,
				  tint = tier.color
				},
				{
				  filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
				  priority = "high",
				  width = 129,
				  height = 100,
				  frame_count = 1,
				  draw_as_shadow = true,
				  shift = {0.421875/3, 0}
				}
			  }
		  },
		  working_visualisations =
		  {
			{
			  animation =
			  {
				filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
				priority = "high",
				width = 25,
				height = 15,
				frame_count = 12,
				animation_speed = 0.5,
				shift = {0.015625/3, 0.890625/3},
				scale = 1/3
			  },
			  light = {intensity = 0.4, size = 6, shift = {0.0, 0.5}, color = {r = 1.0, g = 1.0, b = 1.0}}
			},
			{
			  animation =
			  {
				filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
				priority = "high",
				width = 19,
				height = 13,
				frame_count = 4,
				animation_speed = 0.5,
				shift = {-0.671875/3, -0.640625/3},
				scale = 1/3,
			  }
			},
			{
			  animation =
			  {
				filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
				priority = "high",
				width = 12,
				height = 9,
				frame_count = 4,
				animation_speed = 0.5,
				shift = {0.0625/3, -1.234375/3},
				scale = 1/3,
			  }
			}
		  }
		}
	end,
	item = function(data)
		local name  = data.name
		local order = "c[micro-furnace]-"..data.order
		local tier  = data.tier
	  
		return {
		  type = "item",
		  name = name,
		  icons = {{icon = "__base__/graphics/icons/electric-furnace.png", tint = tier.color}},
		  icon_size = 32,
		  flags = {"goes-to-quickbar"},
		  order = order,
		  subgroup = "smelting-machine",
		  place_result = name,
		  stack_size = 10
		}
	end,
	recipe = function(data)
		local multiplier = data.tier.multiplier
		local recipe = {
			type = "recipe",
			category = "advanced-crafting",
			name = data.name,
			normal = {
			  enabled = false,
			  ingredients = {
				{"electric-furnace", 24 * multiplier},
				{"loader", 2 * multiplier},
				{"steel-plate", 50 * multiplier},
				{"advanced-circuit", 20 * multiplier},
				{"iron-gear-wheel", 20 * multiplier },
				{"iron-stick", 20 * multiplier },
			  },
			  energy_required = 30,
			  result = data.name,
			},
			expensive = {
			  enabled = false,
			  ingredients = {
				{"electric-furnace", 24 * 2 * multiplier},
				{"loader", 2 * 2 * multiplier},
				{"steel-plate", 50 * 2 * multiplier},
				{"advanced-circuit", 20 * 2 * multiplier},
				{"iron-gear-wheel", 20 * 2 * multiplier },
				{"iron-stick", 20 * 2 * multiplier },
			  },
			  energy_required = 120,
			  result = data.name,
			},
		  }
		  return recipe
	end,
	technology = function(d)
		local function getIngredients(d)
			if d.tier.multiplier == 4 then
				return data.raw.technology["bob-logistics-4"].unit.ingredients
			end
			if d.tier.multiplier == 5 then
				return data.raw.technology["bob-logistics-5"].unit.ingredients
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
			prerequisites = {"advanced-material-processing-2", "loader"},
			unit = {
			  count = 200,
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

return electric_micro_furnace