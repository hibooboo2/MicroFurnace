data:extend{
  {
    type = "technology",
    name = "micro-turbo-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects = {{type = "unlock-recipe", recipe = "micro-turbo-furnace"}},
    prerequisites = {"micro-express-furnace", "purple-loader"},
    unit = {
      count = 1600,
      time = 30,
      ingredients = data.raw.technology["bob-logistics-4"].unit.ingredients,
    },
    order = "c-d-d",
  },
  {
    type = "technology",
    name = "micro-ultimate-furnace",
    icon_size = 128,
    icon = "__base__/graphics/technology/advanced-material-processing.png",
    effects = {{type = "unlock-recipe", recipe = "micro-ultimate-furnace"}},
    prerequisites = {"micro-turbo-furnace", "green-loader"},
    unit = {
      count = 3200,
      time = 30,
      ingredients = data.raw.technology["bob-logistics-5"].unit.ingredients,
    },
    order = "c-d-e",
  },
}