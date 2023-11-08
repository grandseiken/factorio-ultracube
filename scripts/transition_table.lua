local transition_table = {
  ["cube-mechanical-network-and-gate"] = {
    {
      type = "immediate",
      recipe = "cube-mechanical-network-and-gate-0",
      transition = "cube-mechanical-network-and-gate-0",
    },
    {
      type = "immediate",
      recipe = "cube-mechanical-network-and-gate-1",
      transition = "cube-mechanical-network-and-gate-1",
    },
  },
  ["cube-mechanical-network-or-gate"] = {
    {
      type = "immediate",
      recipe = "cube-mechanical-network-or-gate-0",
      transition = "cube-mechanical-network-or-gate-0",
    },
    {
      type = "immediate",
      recipe = "cube-mechanical-network-or-gate-1",
      transition = "cube-mechanical-network-or-gate-1",
    },
  },
  ["cube-mechanical-network-xor-gate"] = {
    {
      type = "immediate",
      recipe = "cube-mechanical-network-xor-gate-0",
      transition = "cube-mechanical-network-xor-gate-0",
    },
    {
      type = "immediate",
      recipe = "cube-mechanical-network-xor-gate-1",
      transition = "cube-mechanical-network-xor-gate-1",
    },
  },
  ["cube-mechanical-network-and-gate-0"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-and-gate",
    },
  },
  ["cube-mechanical-network-and-gate-1"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-and-gate",
    },
  },
  ["cube-mechanical-network-or-gate-0"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-or-gate",
    },
  },
  ["cube-mechanical-network-or-gate-1"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-or-gate",
    },
  },
  ["cube-mechanical-network-xor-gate-0"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-xor-gate",
    },
  },
  ["cube-mechanical-network-xor-gate-1"] = {
    {
      type = "completion",
      transition = "cube-mechanical-network-xor-gate",
    },
  },
}

local all_random = {}
for i = 0, 5 do
  for j = i, 5 do
    all_random[#all_random + 1] = "cube-quantum-decoder-" .. i .. "-" .. j
  end
end

local function base_transition_entry(base_name, i, j, k)
  if i == k or j == k then
    return {
      type = "immediate",
      recipe = "cube-qubit-step-" .. k,
      transition = base_name .. "-" .. k,
    }
  else
    return {
      type = "immediate",
      recipe = "cube-qubit-step-" .. k,
      transition = base_name .. "-null",
    }
  end
end

local function step_transition_entry(base_name, n, k)
  if n == k then
    return {
      type = "completion",
      recipe = "cube-qubit-success-" .. k,
      transitions = all_random,
    }
  else
    return {
      type = "completion",
      recipe = "cube-qubit-failure-" .. k,
      transition = base_name,
    }
  end
end

transition_table["cube-quantum-decoder"] = {
  {
    type = "construction",
    transitions = all_random,
  }
}

for i = 0, 5 do
  local base_name = "cube-quantum-decoder-" .. i .. "-" .. i
  local base_table = {}
  local step_table = {}
  for k = 0, 5 do
    base_table[#base_table + 1] = base_transition_entry(base_name, i, i, k)
    step_table[#step_table + 1] = step_transition_entry(base_name, i, k)
  end
  transition_table[base_name] = base_table
  transition_table[base_name .. "-" .. i] = step_table
  transition_table[base_name .. "-null"] = {{type = "completion", transition = base_name}}

  for j = i + 1, 5 do
    local base_name = "cube-quantum-decoder-" .. i .. "-" .. j
    local base_table = {}
    local stepi_table = {}
    local stepj_table = {}
    for k = 0, 5 do
      base_table[#base_table + 1] = base_transition_entry(base_name, i, j, k)
      stepi_table[#stepi_table + 1] = step_transition_entry(base_name, j, k)
      stepj_table[#stepj_table + 1] = step_transition_entry(base_name, i, k)
    end
    transition_table[base_name] = base_table
    transition_table[base_name .. "-" .. i] = stepi_table
    transition_table[base_name .. "-" .. j] = stepj_table
    transition_table[base_name .. "-null"] = {{type = "completion", transition = base_name}}
  end
end

return transition_table