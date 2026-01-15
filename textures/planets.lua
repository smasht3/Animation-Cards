-- ===========================
--      PLANETAS ANIMADOS
-- ===========================

AnimatedPlanets = {
	c_mercury = { frames = 20 }, -- X frames en una fila (71x95 cada frame)
	c_venus = { frames = 15 },
	c_earth = { frames = 15 },
	c_mars = { frames = 15 },
	c_jupiter = { frames = 24 },
	c_saturn = { frames = 20 },
	c_uranus = { frames = 24 },
	c_neptune = { frames = 20 },
	c_pluto = { frames = 15 },
	c_planet_x = { frames = 24 },
	c_ceres = { frames = 24 },
	c_eris = { frames = 15 },
}

-- ===========================
--   REGISTRO DE TEXTURAS
-- ===========================

local silent = true
if SMODS and SMODS.Atlas then
	-- Planetas
	for k, v in pairs(AnimatedPlanets or {}) do
		SMODS.Atlas({
			key = k,
			path = k .. ".png",
			px = v.px or 71,
			py = v.py or 95,
		})
		SMODS.Consumable:take_ownership(k, {
			atlas = k,
			pos = { x = 0, y = 0 },
		})
	end
end
