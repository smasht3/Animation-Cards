local config = SMODS.current_mod.config

-- ===========================
--      CARTAS ANIMADOS
-- ===========================

AnimatedCards = {
	H_2 = { frames_per_row = 15, frames = 15 },
}

-- ===========================
--   REGISTRO DE TEXTURAS
-- ===========================


for k, _ in pairs(AnimatedCards) do
	SMODS.Atlas({
		key = "animated_" .. k,
		px = 71,
		py = 95,
		path = k .. ".png",
	})
	G.P_CARDS[k].lc_atlas = "anc_animated_" .. k
	G.P_CARDS[k].hc_atlas = "anc_animated_" .. k
end