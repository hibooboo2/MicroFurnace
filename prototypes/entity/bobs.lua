local tiers = require "lib.tiers"
local entities = require "lib.entities"

data:extend{
  entities.micro_furnace{
    name = "micro-turbo-furnace",
    tier = tiers.tier_4,
  },
  entities.micro_furnace{
    name = "micro-ultimate-furnace",
    tier = tiers.tier_5,
  },
}