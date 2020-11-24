json.games do
  json.array! @games, :id, :mode, :release_date, :developer, :system_requirement_id
end
