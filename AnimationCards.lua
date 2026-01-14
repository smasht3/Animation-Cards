function debugMessage(message)
	sendDebugMessage("[AnimationCards] " .. message)
end
debugMessage("Launching")

G.F_NO_ACHIEVEMENTS = false
local AnimationCards = SMODS.current_mod

--- Texturas ---
SMODS.load_file("textures/planets.lua")()
SMODS.load_file("textures/cards.lua")()

-- ===========================
--     LÓGICA DE ANIMACIÓN
-- ===========================
Aura = Aura or {}

if not Aura.update_frame then
	function Aura.update_frame(dt, key, center_obj, anim_table)
		local anim = anim_table[key]
		if not (anim and center_obj) then
			return
		end

		anim.t = (anim.t or 0) + dt
		anim.frame = anim.frame or 0
		local fps = anim.fps or 12 -- velocidad base

		if anim.t >= 1 / fps then
			anim.t = anim.t - (1 / fps)
			anim.frame = (anim.frame + 1) % anim.frames

			local fpr = anim.frames_per_row or anim.frames
			center_obj.pos.x = anim.frame % fpr
			center_obj.pos.y = math.floor(anim.frame / fpr)
		end
	end
end
