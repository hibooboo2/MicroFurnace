-- This is just for when testing locally
-- if data == nil then
--   data = {}
--   data.extend = function(dataSentIn, data)
--   end
--   mods = {}
--   -- mods.boblogistics = "fsda"  
-- end
-- End

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
      prerequisites = {"steel-processing"},
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

local lastTier = 3



if mods["boblogistics"] then
  lastTier = 5
end  

for i=1,lastTier do
  local tier = tiersMade[i]
  local isBob = i > 3
  local micro_furnace_types = {
    -- steel_micro_furnace,
    require "prototypes.electric_furnace",
    require "prototypes.stone_furnace",
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
      -- error(serpent.block(technology))

  end
end
