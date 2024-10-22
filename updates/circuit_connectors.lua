local function check_circuit_connectors(machine, is_cube_machine)
  if not settings.startup["cube-circuit-machines"].value then
    machine.enable_logistic_control_behavior = false
    machine.circuit_wire_max_distance = 0
    machine.circuit_connector = nil
  end
end

local function add_circuit_connectors(machine, is_cube_machine, distance, connectors)
  machine.enable_logistic_control_behavior = true
  machine.circuit_wire_max_distance = distance
  machine.circuit_connector = connectors
  check_circuit_connectors(machine, is_cube_machine)
end

local function add_rotated_circuit_connectors(machine, is_cube_machine, distance, connectors)
  add_circuit_connectors(machine, is_cube_machine, distance, circuit_connector_definitions.create_vector(universal_connector_template, connectors))
end

local function add_vector_circuit_connectors(machine, is_cube_machine, distance, variation, offset, shadow_offset, show_shadow)
  add_rotated_circuit_connectors(machine, is_cube_machine, distance, {
    {variation = variation, main_offset = offset, shadow_offset = shadow_offset, show_shadow = show_shadow},
    {variation = variation, main_offset = offset, shadow_offset = shadow_offset, show_shadow = show_shadow},
    {variation = variation, main_offset = offset, shadow_offset = shadow_offset, show_shadow = show_shadow},
    {variation = variation, main_offset = offset, shadow_offset = shadow_offset, show_shadow = show_shadow},
  })
end

add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-synthesizer"], true,
    assembling_machine_circuit_wire_max_distance, 26, util.by_pixel(48, -82), util.by_pixel(64, -64), false)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-ultradense-furnace"], true,
    assembling_machine_circuit_wire_max_distance, 2, util.by_pixel(-28, 76), util.by_pixel(0, 100), true)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-greenhouse"], false,
    assembling_machine_circuit_wire_max_distance, 17, util.by_pixel(-67, -1), util.by_pixel(-77, 10), false)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-stygian-energy-lab"], false,
    assembling_machine_circuit_wire_max_distance, 17, util.by_pixel(-67, -1), util.by_pixel(-77, 10), false)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-electric-furnace"], false,
    assembling_machine_circuit_wire_max_distance, 18, util.by_pixel(8, 12), util.by_pixel(32, 32), true)
add_rotated_circuit_connectors(
    data.raw["assembling-machine"]["cube-fuel-refinery"], true, assembling_machine_circuit_wire_max_distance,
    {
      {variation = 18, main_offset = util.by_pixel(0, -32), shadow_offset = util.by_pixel(8, 0), show_shadow = true},
      {variation = 24, main_offset = util.by_pixel(-8, -32), shadow_offset = util.by_pixel(0, 0), show_shadow = true},
      {variation = 27, main_offset = util.by_pixel(24, -22), shadow_offset = util.by_pixel(32, 10), show_shadow = true},
      {variation = 28, main_offset = util.by_pixel(0, -32), shadow_offset = util.by_pixel(8, 0), show_shadow = true},
    })
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-fabricator"], false,
    assembling_machine_circuit_wire_max_distance, 18, util.by_pixel(39, 32.5), util.by_pixel(46.5, 41.5), true)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-dimension-folding-engine"], true,
    assembling_machine_circuit_wire_max_distance, 25, util.by_pixel(-116.5, 50), util.by_pixel(-111, 55), true)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-cyclotron"], true,
    assembling_machine_circuit_wire_max_distance, 26, util.by_pixel(-47, 31), util.by_pixel(-40, 40), true)
add_vector_circuit_connectors(
    data.raw["assembling-machine"]["cube-forbidden-ziggurat"], true,
    assembling_machine_circuit_wire_max_distance, 26, util.by_pixel(0, 72), util.by_pixel(64, 136), true)
add_rotated_circuit_connectors(
    data.raw["assembling-machine"]["cube-annihilation-chamber"], false,
    assembling_machine_circuit_wire_max_distance,
    {
      {variation = 15, main_offset = util.by_pixel(22, -56), shadow_offset = util.by_pixel(64, 0), show_shadow = true},
      {variation = 10, main_offset = util.by_pixel(28, -20), shadow_offset = util.by_pixel(40, 40), show_shadow = true},
      {variation = 15, main_offset = util.by_pixel(22, -56), shadow_offset = util.by_pixel(64, 0), show_shadow = true},
      {variation = 10, main_offset = util.by_pixel(28, -20), shadow_offset = util.by_pixel(40, 40), show_shadow = true},
    })
add_vector_circuit_connectors(
    data.raw["rocket-silo"]["cube-experimental-teleporter"], true,
    assembling_machine_circuit_wire_max_distance, 19, util.by_pixel(54, 60), util.by_pixel(70, 86), true)
add_circuit_connectors(
    data.raw["reactor"]["cube-nuclear-reactor-base"], true,
    assembling_machine_circuit_wire_max_distance, circuit_connector_definitions.create_single(universal_connector_template, {
      variation = 27, main_offset = util.by_pixel(40, 40), shadow_offset = util.by_pixel(45, 54.5), show_shadow = false,
    }))
add_circuit_connectors(
    data.raw["reactor"]["cube-nuclear-reactor-online"], true,
    assembling_machine_circuit_wire_max_distance, circuit_connector_definitions.create_single(universal_connector_template, {
      variation = 27, main_offset = util.by_pixel(40, 40), shadow_offset = util.by_pixel(45, 54.5), show_shadow = false,
    }))

check_circuit_connectors(data.raw["assembling-machine"]["cube-chemical-plant"])
check_circuit_connectors(data.raw["assembling-machine"]["cube-distillery"])
check_circuit_connectors(data.raw["assembling-machine"]["centrifuge"])