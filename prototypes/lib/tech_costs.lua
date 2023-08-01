local ingredients = {
  ["0"] = {
    {"cube-basic-contemplation-unit", 1},
  },
  ["1a"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
  },
  ["1b"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
  },
  ["2"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
  },
  ["x"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-unobtainium", 1},
  },
}

local time = {
  ["0"] = 10,
  ["1a"] = 20,
  ["1b"] = 30,
  ["2"] = 40,
  ["3"] = 60,
  ["x"] = 600,
}

function tech_cost_unit(level, count)
  return {
    count = count,
    ingredients = ingredients[level],
    time = time[level],
  }
end

function tech_cost_formula(level, formula)
  return {
    count_formula = formula,
    ingredients = ingredients[level],
    time = time[level],
  }
end