-- by wateroff#0001 & glowing-at-the-night
print("Animation Breaker loaded! (with <3 from wateroff#0001)")
local enablecheckbox1 = menu.add_checkbox("Animation Breaker", "backward legs", true)
local enablecheckbox2 = menu.add_checkbox("Animation Breaker", "static legs in air", true)
local enablecheckbox3 = menu.add_checkbox("Animation Breaker", "slide on slowwalk", true)
-- all functions
callbacks.add(e_callbacks.ANTIAIM, function(ctx)
    if enablecheckbox1:get() then
		ctx:set_render_pose(e_poses.RUN, 0)
	end
	if enablecheckbox2:get() then
        ctx:set_render_pose(e_poses.JUMP_FALL, 1)
    end
    if enablecheckbox3:get() then
        ctx:set_render_pose(e_poses.MOVE_BLEND_WALK, 0)
    end
end)