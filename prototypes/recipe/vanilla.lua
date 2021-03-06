data:extend{
  {
    type = "recipe",
    category = "advanced-crafting",
    name = "micro-furnace",
    normal = {
      enabled = false,
      ingredients = {
        {"electric-furnace", 48},
        {"loader", 2},
        {"steel-plate", 50},
        {"electronic-circuit", 20},
        {"iron-gear-wheel", 20},
        {"iron-stick", 20},
      },
      energy_required = 30,
      result = "micro-furnace",
    },
    expensive = {
      enabled = false,
      ingredients = {
        {"electric-furnace", 96},
        {"loader", 10},
        {"steel-plate", 200},
        {"advanced-circuit", 200},
        {"iron-gear-wheel", 200},
        {"iron-stick", 200},
      },
      energy_required = 120,
      result = "micro-furnace",
    },
  },
  {
    type = "recipe",
    category = "advanced-crafting",
    name = "micro-fast-furnace",
    normal = {
      enabled = false,
      ingredients = {
        {"micro-furnace", 2},
        {"fast-loader", 2},
        {"steel-plate", 100},
        {"advanced-circuit", 20},
        {"iron-gear-wheel", 20},
        {"iron-stick", 20},
      },
      energy_required = 30,
      result = "micro-fast-furnace",
    },
    expensive = {
      enabled = false,
      ingredients = {
        {"micro-furnace", 4},
        {"fast-loader", 10},
        {"steel-plate", 400},
        {"advanced-circuit", 200},
        {"iron-gear-wheel", 200},
        {"iron-stick", 200},
      },
      energy_required = 120,
      result = "micro-fast-furnace",
    },
  },
  {
    type = "recipe",
    category = "crafting-with-fluid",
    name = "micro-express-furnace",
    normal = {
      enabled = false,
      ingredients = {
        {"micro-fast-furnace", 2},
        {"express-loader", 2},
        {"steel-plate", 200},
        {"advanced-circuit", 50},
        {"iron-gear-wheel", 20},
        {"iron-stick", 20},
        {type = "fluid", name = "lubricant", amount = 200},
      },
      energy_required = 30,
      result = "micro-express-furnace",
    },
    expensive = {
      enabled = false,
      ingredients = {
        {"micro-fast-furnace", 4},
        {"express-loader", 10},
        {"steel-plate", 800},
        {"processing-unit", 200},
        {"iron-gear-wheel", 200},
        {"iron-stick", 200},
        {type = "fluid", name = "lubricant", amount = 2000},
      },
      energy_required = 30,
      result = "micro-express-furnace",
    },
  },
}