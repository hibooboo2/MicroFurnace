data:extend{
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
}