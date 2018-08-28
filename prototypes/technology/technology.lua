data:extend{
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