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

local initial_states = {}
for i = 0, 5 do
  for j = i, 5 do
    initial_states[#initial_states + 1] = i .. "-" .. j
  end
end

local quantum_decoder_transitions = {}
transition_table["cube-quantum-decoder"] = {
  initial_states = initial_states,
  transitions = quantum_decoder_transitions,
}

for i = 0, 5 do
  for j = i, 5 do
    local initial_state = i .. "-" .. j
    quantum_decoder_transitions[initial_state] = {}
    for k = 0, 5 do
      local step_state = i .. "-" .. j .. "-" .. k
      quantum_decoder_transitions[initial_state]["cube-qubit-consume-" .. k] = {
        state = step_state,
      }
      quantum_decoder_transitions[step_state] = {}
      for l = 0, 5 do
        if (k == i and l == j) or (k == j and l == i) then
          quantum_decoder_transitions[step_state]["cube-qubit-consume-" .. l] = {
            product_recipe = "cube-qubits-success-dummy",
            states = initial_states,
          }
        else
          quantum_decoder_transitions[step_state]["cube-qubit-consume-" .. l] = {
            product_recipe = "cube-qubits-failure-dummy",
            state = initial_state,
          }
        end
      end
    end
  end
end

return transition_table