data:extend{
  {
    type = "technology",
    name = "micro-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects = {{type = "unlock-recipe", recipe = "micro-furnace"}},
    prerequisites = {"advanced-material-processing", "loader"},
    unit = {
      count = 200,
      time = 30,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
    },
    order = "c-d-a",
  },
  {
    type = "technology",
    name = "micro-fast-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects = {{type = "unlock-recipe", recipe = "micro-fast-furnace"}},
    prerequisites = {"micro-furnace", "fast-loader"},
    unit = {
      count = 400,
      time = 30,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
    },
    order = "c-d-b",
  },
  {
    type = "technology",
    name = "micro-express-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects = {{type = "unlock-recipe", recipe = "micro-express-furnace"}},
    prerequisites = {"micro-fast-furnace", "express-loader"},
    unit = {
      count = 800,
      time = 30,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
      },
    },
    order = "c-d-c",
  },
}