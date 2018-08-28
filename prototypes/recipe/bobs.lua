data:extend{
  {
    type = "recipe",
    category = "advanced-crafting",
    name = "micro-turbo-furnace",
    normal = {
      enabled = false,
      ingredients = {
        {"micro-express-furnace", 2},
        {"purple-loader", 2},
        {"steel-plate", 400},
        {"processing-unit", 20},
        {"iron-gear-wheel", 20},
        {"iron-stick", 20},
      },
      energy_required = 30,
      result = "micro-turbo-furnace",
    },
    expensive = {
      enabled = false,
      ingredients = {
        {"micro-express-furnace", 4},
        {"purple-loader", 10},
        {"steel-plate", 1600},
        {"processing-unit", 200},
        {"iron-gear-wheel", 200},
        {"iron-stick", 200},
      },
      energy_required = 120,
      result = "micro-turbo-furnace",
    },
  },
  {
    type = "recipe",
    category = "advanced-crafting",
    name = "micro-ultimate-furnace",
    normal = {
      enabled = false,
      ingredients = {
        {"micro-turbo-furnace", 2},
        {"green-loader", 2},
        {"steel-plate", 800},
        {"processing-unit", 20},
        {"iron-gear-wheel", 20},
        {"iron-stick", 20},
      },
      energy_required = 30,
      result = "micro-ultimate-furnace",
    },
    expensive = {
      enabled = false,
      ingredients = {
        {"micro-turbo-furnace", 4},
        {"green-loader", 10},
        {"steel-plate", 3200},
        {"processing-unit", 200},
        {"iron-gear-wheel", 200},
        {"iron-stick", 200},
      },
      energy_required = 120,
      result = "micro-ultimate-furnace",
    },
  },
}