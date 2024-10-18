empty_sprite = {
  filename = "__Krastorio2Assets__/entities/empty.png",
  priority = "high",
  width = 1,
  height = 1,
  scale = 0.5,
  shift = {0, 0},
}

pipe_path = {
  north = empty_sprite,
  east = empty_sprite,
  south = {
    filename = "__Krastorio2Assets__/entities/pipe-patch/hr-pipe-patch.png",
    priority = "high",
    width = 55,
    height = 50,
    scale = 0.5,
    shift = {0.01, -0.58},
  },
  west = empty_sprite,
}