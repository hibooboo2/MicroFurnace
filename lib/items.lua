local function micro_furnace_item(data)
  local name  = data.name
  local order = data.order
  local tier  = data.tier

  return {
    type = "item",
    name = name,
    icons = {{icon = "__base__/graphics/icons/electric-furnace.png", tint = tier.color}},
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    order = order,
    subgroup = "smelting-machine",
    place_result = name,
    stack_size = 10
  }
end

return {
  micro_furnace = micro_furnace_item
}