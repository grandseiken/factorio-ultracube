local transition_table = {
  ["cube-mechanical-network-and-gate"] = {
    initial_state = "init",
    transitions = {
      init = {
        ["cube-mechanical-network-bit-0-consume"] = {state = "0"},
        ["cube-mechanical-network-bit-1-consume"] = {state = "1"},
      },
      ["0"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
      },
      ["1"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
      },
    },
  },
  ["cube-mechanical-network-or-gate"] = {
    initial_state = "init",
    transitions = {
      init = {
        ["cube-mechanical-network-bit-0-consume"] = {state = "0"},
        ["cube-mechanical-network-bit-1-consume"] = {state = "1"},
      },
      ["0"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
      },
      ["1"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
      },
    },
  },
  ["cube-mechanical-network-xor-gate"] = {
    initial_state = "init",
    transitions = {
      init = {
        ["cube-mechanical-network-bit-0-consume"] = {state = "0"},
        ["cube-mechanical-network-bit-1-consume"] = {state = "1"},
      },
      ["0"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
      },
      ["1"] = {
        ["cube-mechanical-network-bit-0-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-1", amount = 1},
        },
        ["cube-mechanical-network-bit-1-consume"] = {
          state = "init",
          product = {name = "cube-mechanical-network-bit-0", amount = 1},
        },
      },
    },
  },
}

local partial_result = {
  {{name = "cube-qubit-0", amount = 1}},
  {{name = "cube-qubit-1", amount = 1}},
  {{name = "cube-qubit-2", amount = 1}},
  {{name = "cube-qubit-3", amount = 1}},
  {{name = "cube-qubit-4", amount = 1}},
  {{name = "cube-qubit-5", amount = 1}},
}
local function make_quantum_decoder_transitions(with_partial)
  local initial_states = {}
  for i = 0, 5 do
    for j = i, 5 do
      initial_states[#initial_states + 1] = i .. "-" .. j
    end
  end
  local transitions = {}

  for i = 0, 5 do
    for j = i, 5 do
      local initial_state = i .. "-" .. j
      transitions[initial_state] = {}
      for k = 0, 5 do
        local step_state = i .. "-" .. j .. "-" .. k
        transitions[initial_state]["cube-qubit-consume-" .. k] = {
          state = step_state,
        }
        transitions[step_state] = {}
        for l = 0, 5 do
          if (k == i and l == j) or (k == j and l == i) then
            transitions[step_state]["cube-qubit-consume-" .. l] = {
              product_recipe = "cube-qubits-success-dummy",
              states = initial_states,
            }
          elseif with_partial and (k == i or l == j or k == j or l == i) then
            transitions[step_state]["cube-qubit-consume-" .. l] = {
              random_products = partial_result,
              state = initial_state,
            }
          else
            transitions[step_state]["cube-qubit-consume-" .. l] = {
              product_recipe = "cube-qubits-failure-dummy",
              state = initial_state,
            }
          end
        end
      end
    end
  end

  return {
    initial_states = initial_states,
    transitions = transitions,
  }
end

transition_table["cube-quantum-decoder"] = make_quantum_decoder_transitions(false)
transition_table["cube-quantum-decoder-1"] = make_quantum_decoder_transitions(true)
return transition_table