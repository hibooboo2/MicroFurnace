local productivity_affected_recipes = {
  "micro-steel-plate"
}

for _, module in pairs(data.raw["module"]) do
  if module.name:find("productivity") and module.limitation then
    for _, recipe in ipairs(productivity_affected_recipes) do
      table.insert(module.limitation, recipe)
    end
  end
end