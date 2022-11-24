-- created with <3 from wateroff#0001 (glowing-at-the-night)

-- calling bit from Na'Vi
require 'bit'

-- local UI 
local uiselect = ui.new_multiselect("LUA", "B", "Old AnimFix", "Freeze Legs in Air", "Pitch 0 on land", "Leg fucker")

-- fakelag locals
local limitfl = ui.reference("AA", "Fake lag", "Limit")
local ground_ticks, end_time = 1, 0

-- idk where im found it but it's worki good
local function table_contains(tbl, val)
    for i=1,#tbl do
        if tbl[i] == val then
            return true
        end
    end
    return false
end

client.set_event_callback("pre_render", function ()

	if not entity.is_alive(entity.get_local_player()) then return end
	if table_contains(ui.get(uiselect),"Freeze Legs in Air") then
		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6) 
	end

	if table_contains(ui.get(uiselect),"Leg fucker") then
		entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 8, 0)
	end

    if table_contains(ui.get(uiselect),"Pitch 0 on land") then
        local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1)

        if on_ground == 1 then
            ground_ticks = ground_ticks + 1
        else
            ground_ticks = 0
            end_time = globals.curtime() + 1
        end 
    
        if ground_ticks > ui.get(limitfl)+1 and end_time > globals.curtime() then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
        end
    end
end)