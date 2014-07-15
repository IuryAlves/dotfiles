--[[
Conky Widgets by olgmen (2010)

выводит только стрелки часов с тенью
]]

require 'cairo'

--[[ CLOCK WIDGET ]]

function display_clock(t)


	lp = 0
	mark = (2*math.pi)/12
	repeat

	xss = t.x + 0.41*t.clock_r*math.sin(mark + mark*lp)
	yss = t.y - 0.41*t.clock_r*math.cos(mark + mark*lp)

	xs = t.x + 0.85*t.clock_r*math.sin(mark + mark*lp)
	ys = t.y - 0.85*t.clock_r*math.cos(mark + mark*lp)
	cairo_move_to(cr, xss, yss)
	cairo_line_to(cr, xs, ys)
	cairo_set_line_width(cr, 1)
	cairo_set_source_rgba(cr, 1, 1, 1, 0.5) -- ,0,0,0,0.4
	cairo_stroke(cr)

	lp = lp + 1

	until lp >= 12

-- часовые стрелки с тенью, взято из Shadowed clock by wlourf (10 jan. 2010)

	function draw_hand(a_trame, arc, arc0, arc1, lg, r, border, rgb)

		xx = t.x + t.clock_r*math.sin(arc)*lg
		yy = t.y - t.clock_r*math.cos(arc)*lg
		x0 = t.x + r*math.sin(arc0)
		y0 = t.y - r*math.cos(arc0)
		x1 = t.x + r*math.sin(arc1)
		y1 = t.y - r*math.cos(arc1)

		if border ~= nil then
			cairo_set_line_width(cr, 1)
			cairo_set_source_rgba(cr, border[1], border[2], border[3], 0.5)
			cairo_move_to (cr, x0, y0)
			cairo_curve_to (cr, x0, y0, xx, yy, x1, y1)
			cairo_arc(cr, t.x, t.y, r, arc1 - math.pi/2, arc0 - math.pi/2)
			cairo_stroke(cr)
		end

-- рисуем тень

		cairo_move_to (cr, x0, y0)
		cairo_curve_to (cr, x0, y0, xx + t.shadow_xoffset, yy + t.shadow_yoffset, x1, y1)
		cairo_arc(cr, t.x, t.y, r, arc1 - math.pi/2, arc0 - math.pi/2)
		pat = cairo_pattern_create_radial (t.x, t.y, 0, t.x, t.y, t.clock_r)
		cairo_pattern_add_color_stop_rgba (pat, 0, 0, 0, 0, t.shadow_opacity)
		cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 0)
		cairo_set_source (cr, pat)
		cairo_fill (cr)

-- рисуем стрелки

		cairo_move_to (cr, x0, y0)
		cairo_curve_to (cr, x0, y0, xx, yy, x1, y1)
		cairo_arc(cr, t.x, t.y, r, arc1 - math.pi/2, arc0 - math.pi/2)
		pat = cairo_pattern_create_radial (t.x, t.y, t.clock_r/10, t.x, t.y, t.clock_r*lg)
		cairo_pattern_add_color_stop_rgba (pat, 0, rgb[1], rgb[2], rgb[3], 1)
		cairo_pattern_add_color_stop_rgba (pat, 1, 0, 0, 0, 1)
		cairo_set_source (cr, pat)
		cairo_fill (cr)
		cairo_pattern_destroy (pat)
	end

-- забираем данные из ОС

		local hours = os.date("%I")
		local mins = os.date("%M")
		local secs = os.date("%S")

-- расчет угла движения стрелок

		gamma = math.pi/2 - math.atan(t.rs/(t.clock_r*t.lgs))
		secs_arc = (2*math.pi/60)*secs
		secs_arc0 = secs_arc - gamma
		secs_arc1 = secs_arc + gamma

		gamma = math.pi/2 - math.atan(t.rm/(t.clock_r*t.lgm))
		mins_arc = (2*math.pi/60)*mins + secs_arc/60
		mins_arc0 = mins_arc - gamma
		mins_arc1 = mins_arc + gamma

		gamma = math.pi/2 - math.atan(t.rh/(t.clock_r*t.lgh))
		hours_arc = (2*math.pi/12)*hours + mins_arc/12
		hours_arc0 = hours_arc - gamma
		hours_arc1 = hours_arc + gamma

-- вывод стрелок

	draw_hand(alpha_trame,hours_arc,hours_arc0,hours_arc1,t.lgh,t.rh,{0,0,0},{1,1,1})
	draw_hand(alpha_trame,mins_arc,mins_arc0,mins_arc1,t.lgm,t.rm,{0,0,0},{.9,.9,.9})

	if t.show_seconds then
		draw_hand(alpha_trame,secs_arc,secs_arc0,secs_arc1,t.lgs,t.rs,{0,0,0},{.8,.8,.8})
	end

-- рисуем ось стрелок

	if show_dot then

		lg_shadow_center=3
		radius=math.min(rh,rm,rs)*0.75

		if radius<1 then radius=1 end

		ang = math.atan(shadow_yoffset/shadow_xoffset)


	local border_pat=cairo_pattern_create_linear(m_x, m_y - radius*1.15, m_x, m_y + radius*1.25)
-- тень от оси
		cairo_pattern_add_color_stop_rgba(border_pat,0,0,0,0,0.7)
		cairo_pattern_add_color_stop_rgba(border_pat,0.3,0.5,1,1,0)
		cairo_pattern_add_color_stop_rgba(border_pat,0.5,0.5,1,1,0)
		cairo_pattern_add_color_stop_rgba(border_pat,0.7,0.5,1,1,0)
		cairo_pattern_add_color_stop_rgba(border_pat,1,0,0,0,0.7)
		cairo_set_source(cr,border_pat)
		cairo_arc(cr, m_x, m_y, radius*1.125, 0, 2*math.pi)
		cairo_close_path(cr)
		cairo_set_line_width(cr, radius*0.25)
		cairo_stroke(cr)

		gamma = -math.atan(1/lg_shadow_center)
		ang0=ang-gamma
		ang1=ang+gamma

	end

end

