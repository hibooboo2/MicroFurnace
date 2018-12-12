-- This is just for when testing locally
if data == nil then
  data = {}
  data.extend = function(dataSentIn, data)
  end
  mods = {}
  -- mods.boblogistics = "fsda"  
end
-- End

local electric_micro_furnace = {
  type = "electirc",
  entity = function(data)
      local name = data.name
      local tier = data.tier
      return {
        type = "assembling-machine",
        name = name,
        icons = {{icon = "__base__/graphics/icons/electric-furnace.png", tint = tier.color}},
        icon_size = 32,
        flags = {"placeable-player", "player-creation"},
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
        crafting_speed = tier.multiplier * 140/3,
        energy_usage = tier.multiplier * 8640 .. "kW",
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
              {"electric-furnace", 48 * multiplier},
              {"loader", 2 * multiplier},
              {"steel-plate", 50 * multiplier},
              {"advanced-circiut", 20 * multiplier},
              {"iron-gear-wheel", 20 * multiplier },
              {"iron-stick", 20 * multiplier },
            },
            energy_required = 30,
            result = data.name,
          },
          expensive = {
            enabled = false,
            ingredients = {
              {"electric-furnace", 48 * 2 * multiplier},
              {"loader", 2 * 2 * multiplier},
              {"steel-plate", 50 * 2 * multiplier},
              {"advanced-circiut", 20 * 2 * multiplier},
              {"iron-gear-wheel", 20 * 2 * multiplier },
              {"iron-stick", 20 * 2 * multiplier },
            },
            energy_required = 120,
            result = data.name,
          },
        }
  end,
  technology = function(data)
      local tech =  {
          type = "technology",
          name = data.name,
          icon_size = 128,
          icon = "__base__/graphics/technology/advanced-material-processing.png",
          effects = {{type = "unlock-recipe", recipe = data.name }},
          prerequisites = {"advanced-material-processing-2", "loader"},
          unit = {
            count = 200,
            time = 30,
            ingredients = {
              {"science-pack-1", 1},
              {"science-pack-2", 1},
              {"science-pack-3", 1},
            },
          },
          order = "c-d-"..data.order,
        }
      for i=0,data.tier.multiplier-2 do
          tech.unit.count = tech.unit.count * 2
      end
      return tech
  end,
}

local function tiers() 
  local colors =  {
      {r=178, g=173, b=100},
      {r=202, g=154, b=152},
      {r=132, g=180, b=181},
      {r=189, g=153, b=200},
      {r=133, g=193, b=130},
  }
  local tiers = {}
  for i=1,5 do
      local tier = i
      tiers[tier] = {
          multiplier = tier,
          module_slots = tier+1, 
          color = colors[i],
      }
      if tier == 4 then
          tiers[tier].module_slots = 4
      end
  end
  return tiers
end

local tiersMade = tiers()

local names = {
  "micro-furnace",
  "micro-fast-furnace",
  "micro-express-furnace",
  "micro-turbo-furnace",
  "micro-ultimate-furnace",
}

local lastTier = 3



if mods["boblogistics"] then
  lastTier = 5
end

data:extend{
  {
    type = "recipe-category",
    name = "micro-furnace-smelting",
  },
  {
      type = "item-subgroup",
      name = "micro-furnace-smelting",
      group = "production",
      order = "a-a",
  },  
  {
      type = "recipe",
      name = "micro-steel-plate",
      category = "micro-furnace-smelting",
      normal = {
        enabled = false,
        energy_required = 17.5,
        ingredients = {{"iron-ore", 5}},
        result = "steel-plate",
      },
      expensive = {
        enabled = false,
        energy_required = 35,
        ingredients = {{"iron-ore", 10}},
        result = "steel-plate",
      },
  },
  {
      type = "technology",
      name = "micro-furnace-steel-processing",
      icon_size = 128,
      icon = "__base__/graphics/technology/steel-processing.png",
      effects = {{type = "unlock-recipe", recipe = "micro-steel-plate"}},
      prerequisites = {"steel-processing", "micro-fast-furnace"},
      unit = {
        count = 200,
        time = 30,
        ingredients = {
          {"science-pack-1", 2},
          {"science-pack-2", 2},
          {"science-pack-3", 1},
        }
      },
      order = "c-e-a",
  },
}  

for i=1,lastTier do
  local tier = tiersMade[i]
  local isBob = i > 3
  local micro_furnace_types = {
     electric_micro_furnace
  }
  for j in ipairs(micro_furnace_types) do
      local micro_furnace = micro_furnace_types[j]
      local name = micro_furnace.type .. "-" .. names[i]
      local d = {
          type = micro_furnace.type,
          name = name,
          tier = tier,
          isBob = isBob,
          order = string.char(string.byte("a")+(tier.multiplier-1)),
      }
      local entity = micro_furnace.entity(d)
      local recipe = micro_furnace.recipe(d)
      local technology = micro_furnace.technology(d)      
      local item = micro_furnace.item(d)
      data:extend{
          entity,
          item,
          recipe,
          technology,
      }    
  end
end