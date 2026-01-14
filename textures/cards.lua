local config = SMODS.current_mod.config
--local seed = config['Guayando']

-- ===========================
--      CARTAS ANIMADOS
-- ===========================

    AnimatedCards = {

        H_2  = { frames_per_row = 15, frames = 15 },

    }


-- ===========================
--   REGISTRO DE TEXTURAS
-- ===========================

local silent = true
if SMODS and SMODS.Atlas then
    -- Cartas
    for k, v in pairs(AnimatedCards or {}) do
        SMODS.Atlas {
            key = k,
            path = k .. ".png",
            px = v.px or 71,
            py = v.py or 95
        }
        SMODS.Consumable:take_ownership(k, {
            atlas = k,
            pos = { x = 0, y = 0 }
        })
    end
end

-- ===========================
--   HOOK A Game:update
-- ===========================


local _game_update = Game.update
function Game:update(dt)
    _game_update(self, dt)

    if G and G.P_CARDS then
        -- Animar Cartas
        for key, _ in pairs(AnimatedCards or {}) do
            local center = G.P_CARDS[key]
            if center then
                Aura.update_frame(dt, key, center, AnimatedCards)
            end
        end
    end
end