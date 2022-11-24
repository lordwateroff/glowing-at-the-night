-- credits: @steezy
local is_enabled = {ui.reference("RAGE", "Aimbot", "Dormant Aimbot")}

client.set_event_callback('paint', function()
    local lp = entity.get_local_player()
    if lp == nil or not entity.is_alive(lp) then return end 

    if ui.get(is_enabled[1]) and ui.get(is_enabled[2]) then 
        renderer.indicator(132, 196, 20, 245, "DA") -- the original color one
    end
end)