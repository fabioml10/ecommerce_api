json.system_requirements do
  json.array! @system_requirements, :id,:name,:os,:storage,:processor,:memory,:video_board
end

