local function micro_furnace_entity(data)
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
end

return {
  micro_furnace = micro_furnace_entity
}
