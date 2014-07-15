--[[ Простой скрипт вывода текста
by olgmen 28.01.2011

Скрипт выводит текст и способен

- центровать текст относительно координаты Х

	h_align = "l"		-- текст начинается от координаты Х ( по умолчанию )
	h_align = "r"		-- текст заканчивается на координате Х
	h_align = "m"	-- середина текста на координате Х

- центрировать текст относительно координаты Y

	v_align = "b"		-- текст выше координаты Y ( по умолчанию )
	v_align = "t"		-- текст ниже координаты Y
	v_align = "m"	-- координата Y по центру текста

-- поворачивать текст

	angle = "угол поворота в градусах"		-- по умочанию равен 0
]]

require 'cairo'

function conky_draw_text()
	
	text_settings={
			
{
text = conky_parse("${time %S}"),
x = 10,
y = 120,
bold = true,
},
}

	if conky_window == nil then return end

	if tonumber(conky_parse("$updates"))<3 then return end

	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)

	for i,v in pairs(text_settings) do

		cr = cairo_create (cs)
		display_text(v)
		cairo_destroy(cr)
	end

	cairo_surface_destroy(cs)
end
-- -----------------------------------------
-- функция перекодировки цвета
function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
-- -----------------------------------------

function display_text(t)

	if t.text	== nil then t.text = "Conky is good for you !" end
	if t.x		== nil then t.x = conky_window.width/2 end
	if t.y		== nil then t.y = conky_window.height/2 end
	if t.colour	== nil then t.colour = 0xffffff end
	if t.alpha	== nil then t.alpha = 1 end
	if t.font_name	== nil then t.font_name = "Verdana" end
	if t.font_size	== nil then t.font_size = 14 end
	if t.angle	== nil then t.angle = 0 end
	if t.italic	== nil then t.italic = false end
	if t.bold	== nil then t.bold = false end
	if t.h_align	== nil then t.h_align = "l" end
	if t.v_align	== nil then t.v_align = "b" end

	cairo_translate(cr, t.x, t.y)
	cairo_rotate(cr, t.angle*math.pi/180)

-- настройка шрифта

	local slant = CAIRO_FONT_SLANT_NORMAL
	local weight =CAIRO_FONT_WEIGHT_NORMAL

	if t.italic then slant = CAIRO_FONT_SLANT_ITALIC end
	if t.bold then weight = CAIRO_FONT_WEIGHT_BOLD end

	cairo_select_font_face(cr, t.font_name, slant, weight)

	cairo_set_font_size(cr, t.font_size)

	te=cairo_text_extents_t:create()
	cairo_text_extents (cr,t.text,te)

-- настройка цвета

	cairo_set_source_rgba(cr, rgb_to_r_g_b(t.colour, t.alpha))

-- вывод текста
            
    mx,my=0,0
    
    if t.h_align=="c" then
        mx=-te.width/2
    elseif t.h_align=="r" then
        mx=-te.width
    end
    if t.v_align=="m" then
        my=-te.height/2-te.y_bearing
    elseif t.v_align=="t" then
        my=-te.y_bearing
    end
 
    cairo_move_to(cr,mx,my)
    cairo_show_text(cr,t.text)
     
end

