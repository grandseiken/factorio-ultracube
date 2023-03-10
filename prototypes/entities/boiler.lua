local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local boiler_data = data.raw.boiler.boiler

data:extend({
  {
    type = "boiler",
    name = "cube-boiler",
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "cube-boiler"},
    max_health = 200,
    corpse = "boiler-remnants",
    dying_explosion = "boiler-explosion",
    vehicle_impact_sound = sounds.generic_impact,
    mode = "output-to-separate-pipe",
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    target_temperature = 215,
    fluid_box = {
      base_area = 1,
      height = 2,
      base_level = -1,
      pipe_covers = pipecoverspictures(),
      pipe_connections = {{type = "input", position = {0, -1.5}}},
      production_type = "input",
      filter = "water"
    },
    output_fluid_box = {
      base_area = 1,
      height = 2,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections = {
        {type = "output", position = {-2, 0.5}},
        {type = "output", position = {2, 0.5}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "500MW",
    energy_source = {
      type = "burner",
      fuel_categories = {"cube-cube"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      emissions_per_minute = 30,
      light_flicker = boiler_data.energy_source.light_flicker,
      smoke = boiler_data.energy_source.smoke,
      render_no_power_icon = false,
    },
    burning_cooldown = 20,

    working_sound = boiler_data.working_sound,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    structure = boiler_data.structure,
    patch = boiler_data.patch,
    water_reflection = boiler_data.water_reflection,
    fire_flicker_enabled = true,
    fire_glow_flicker_enabled = true,
    fire = boiler_data.fire,
    fire_glow = boiler_data.fire_glow,
  },
})
