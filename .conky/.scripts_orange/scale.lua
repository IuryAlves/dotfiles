--[[dials mrpeachy may 2011

подогнал под свои конки olgmen 11.12.2011

для работы необходимо добавить в conkyrc выше слова TEXT

lua_load /path to file/main.lua   -- modify for whatever and wherever you saved the file
lua_draw_hook_pre draw_fig            -- needs to be this unchanged

]]

require 'cairo'

function conky_draw_fig()

scale_settings = {

{
name = "",
arg = math.ceil(conky_parse("${time %S}")),
x = 100,
y = 50.5,
w = 60,
h = 200,
label = "ETH1  KiB",			--label above dial
scale = 40,				--how many divisions can be seen in the dial
font = "Ubuntu",
fsize = 12,		--number font and font size
},

--{
--name = "cpu",
--arg = "cpu0",
--max = 60,
--x = 140.5,
--y = 270.5,
--w = 50,
--h = 100,
--value = conky_parse("${cpu cpu1}"),
--label = "CORE 1",
--scale = 20,
--font ="Ubuntu",
--fsize = 12,
--},

}

	if conky_window == nil then return end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)

	for i,v in pairs(scale_settings) do    
	        cr = cairo_create (cs)
	        dialgraph(v)
	        cairo_destroy(cr)
	end
end
-- ---------------------------------------------------------------------
-- функция перекодировки цвета
function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
-- ---------------------------------------------------------------------
function dialgraph (t)

	if t.x			== nil then t.x = conky_window.width/2 end
	if t.y			== nil then t.y = conky_window.height/2 end
	if t.colour		== nil then t.colour = 0xc0c0c0 end
	if t.alpha		== nil then t.alpha = 1 end
	if t.font_name	== nil then t.font_name = "Ubuntu" end
	if t.font_size	== nil then t.font_size = 14 end

	local value = 0

	if t.name ~="" then
		value = tonumber(conky_parse(string.format('${%s %s}', t.name, t.arg)))
	else
		value = tonumber(t.arg)
	end
	if value==nil then value =0 end

--valuegraph

local	adj = (value % 5)
local	lines = tonumber(t.scale)
local	gap = t.h/lines
	cairo_set_line_width (cr, 1)
	cairo_set_source_rgba (cr, 1, 1, 1, 1)
	cairo_select_font_face (cr, t.font_name, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
	cairo_set_font_size (cr, t.font_size)
--calculate line and number positions
	for i = 2,lines do
		n = i
		for i = 1, lines, 5 do
--print (i)
			if n == (lines/2)+(5-adj)+i or n == (lines/2)+(5-adj)+(-i-3) then
				len = -2*(t.w/5)
			else
				len = -1*(t.w/5)
			end

			if n == (lines/2)+(5-adj)+i then
				num = value - adj + (i + 4)
				elseif n == (lines/2)+(5-adj)+(-i-3) then
					num = value - adj-(i-1)
				else
					num = ""
			end
--print lines
			cairo_move_to (cr, t.x+(t.w/2), t.y+t.h-(gap*(n-1)))
			cairo_rel_line_to (cr, len, 0)
			cairo_stroke (cr)
--print numbers
			cairo_move_to (cr, t.x+(t.w/2)+2, t.y+t.h-(gap*(n-1))+(t.font_size/3))
			cairo_show_text (cr, num)
			cairo_stroke (cr)
		end--for
	end--for
--middle lines
	cairo_set_source_rgba(cr, rgb_to_r_g_b(t.colour, t.alpha))
	cairo_move_to (cr, t.x + t.w, t.y + (t.h/2)+2)
	cairo_rel_line_to (cr, -t.w, 0)
	cairo_stroke (cr)
	cairo_move_to (cr, t.x + t.w, t.y + (t.h/2)-2)
	cairo_rel_line_to (cr, -t.w, 0)
	cairo_stroke (cr)

--gradient overlay
	pat = cairo_pattern_create_linear (0, t.y, 0, t.y + t.h)
	cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1)
	cairo_pattern_add_color_stop_rgba (pat, 0.5, 0, 0, 0, 0)
	cairo_pattern_add_color_stop_rgba (pat, 0, 0, 0, 0, 1)
	cairo_rectangle (cr, t.x, t.y, t.w, t.h)
	cairo_set_source (cr, pat)
	cairo_fill (cr)
	cairo_pattern_destroy (pat)

end
