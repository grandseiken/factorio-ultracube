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
  ["3"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-deep-introspection-card", 1},
  },
  ["4"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-synthetic-premonition-card", 1},
  },
  ["5"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-deep-introspection-card", 1},
    {"cube-synthetic-premonition-card", 1},
  },
  ["6"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-deep-introspection-card", 1},
    {"cube-synthetic-premonition-card", 1},
    {"cube-complete-annihilation-card", 1},
  },
  ["x"] = {
    {"cube-basic-contemplation-unit", 1},
    {"cube-fundamental-comprehension-card", 1},
    {"cube-abstract-interrogation-card", 1},
    {"cube-deep-introspection-card", 1},
    {"cube-synthetic-premonition-card", 1},
    {"cube-complete-annihilation-card", 1},
    {"cube-unobtainium", 1},
  },
}

local time = {
  ["0"] = 10,
  ["1a"] = 20,
  ["1b"] = 30,
  ["2"] = 40,
  ["3"] = 60,
  ["4"] = 60,
  ["5"] = 90,
  ["6"] = 120,
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

function tech_unlock_effect()
  return {
    type = "nothing",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/entities/biusart-lab.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/effect-constant/effect-constant-capacity.png",
        icon_size = 64, icon_mipmaps = 2,
      }
    },
    effect_description = {"effect-description.cube-technology-unlock"},
  }
end