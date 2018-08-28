local tiers = require "lib.tiers"
local items = require "lib.items"

data:extend{
  items.micro_furnace{
    name = "micro-turbo-furnace",
    tier = tiers.tier_4,
    order = "c[micro-furnace]-d",
  },
  items.micro_furnace{
    name = "micro-ultimate-furnace",
    tier = tiers.tier_5,
    order = "c[micro-furnace]-e",
  },
}