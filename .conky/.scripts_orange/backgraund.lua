--[[ backgraund.lua от olgmen 16.11.2010

Выводит в окно conky фон с градиентной окраской
Для запуска скрипта поместите следующие строки в conkyrc выше слова TEXT

Displays the window conky background with gradient color
To run the script put the following lines to the above words conkyrc 

lua_load /path/to/the/lua/script/backgraund.lua
lua_draw_hook_pre draw_content

]]
require 'cairo'

function conky_draw_backgraund()


backgraund_settings={

{
--orientation = orientation,
bg_colour = {{0, 0x31489c, 0.5},{0.5, 0x9c5930, 0.75},{1, 0x889c30, 0.3}},
},

}

	if conky_window==nil then return end

	local cs=cairo_xlib_surface_create(conky_window.display,
		conky_window.drawable, 
		conky_window.visual, conky_window.width, conky_window.height)
	cr=cairo_create(cs)

	for i,v in pairs(backgraund_settings) do
		display_background(v)
	end

	cairo_destroy(cr)

end
-- ------------------------------------------------------------
function display_background(t)

	if t.x			== nil then t.x = 0 end
	if t.y			== nil then t.y = 0 end
	if t.width		== nil then t.width = conky_window.width end
	if t.height		== nil then t.height = conky_window.height end
	if t.radius		== nil then t.radius = (t.width+t.height)/2*0.04 end
	if t.orientation	== nil then t.orientation = "ww" end

	if t.bg_colour == nil then
		t.bg_colour = {{0, 0x00ffff, 0.1},{0.5, 0x00FFFF, 0.5},{1, 0x00FFFF, 0.1}}
	end

	local degrees = math.pi / 180.0

	cairo_new_sub_path (cr)

	cairo_arc (cr, t.x + t.width - t.radius, t.y + t.radius, t.radius, -90 * degrees, 0 * degrees)
	cairo_arc (cr, t.x + t.width - t.radius, t.y + t.height - t.radius, t.radius, 0 * degrees, 90 * degrees)
	cairo_arc (cr, t.x + t.radius, t.y + t.height - t.radius, t.radius, 90 * degrees, 180 * degrees)
	cairo_arc (cr, t.x + t.radius, t.y + t.radius, t.radius, 180 * degrees, 270 * degrees)

	cairo_close_path (cr)

        if #t.bg_colour == 1 then 
		cairo_set_source_rgba(cr,rgb_to_r_g_b2(t.bg_colour[1]))
	else
		local pat
		local pts=linear_orientation_bg(t)
		pat = cairo_pattern_create_linear (pts[1], pts[2], pts[3], pts[4])

		for i=1, #t.bg_colour do
			cairo_pattern_add_color_stop_rgba (pat, t.bg_colour[i][1], rgb_to_r_g_b2(t.bg_colour[i]))
		end

		cairo_set_source (cr, pat)
		cairo_fill (cr)
		cairo_pattern_destroy(pat)
	end
end

-- ---------------------------------------
function rgb_to_r_g_b2(tcolour)
    colour, alpha = tcolour[2], tcolour[3]
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
-- ----------------------------------------

-- ----------------------------------------------
function linear_orientation_bg(t)

	if t.orientation	== "nn" then
		p = {t.x + t.width/2, t.y, t.x + t.width/2, t.y + t.height}
	elseif t.orientation	== "ne" then
		p = {t.x + t.width, t.y, t.x, t.y + t.height}
	elseif t.orientation	== "ee" then
		p = {t.x + t.width, t.y + t.height/2, t.x, t.y + t.height/2}
	elseif t.orientation	== "se" then
		p = {t.x +t.width, t.y + t.height, t.x, t.y}
	elseif t.orientation	== "ss" then
		p = {t.x + t.width/2, t.y + t.height, t.x + t.width/2, t.y}
	elseif t.orientation	== "sw" then
		p = {t.x, t.y + t.height, t.x + t.width, t.y}
	elseif t.orientation	== "ww" then
		p = {t.x, t.y + t.height/2, t.x + t.width, t.y + t.height/2}
	else
		p = {t.x, t.y, t.x + t.width, t.y + t.height}
	end

    return p
end
