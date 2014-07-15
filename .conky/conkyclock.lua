--[[ Conky Clock Widget by jpope
    Most work here done by other conky masters with some slight modifications. ;)
    v1.4.2011.08.28 Trimmed config and removed options for use with Conky LED sidebar
    -1.3.2010.10.30
    -1.2.2010.10.26
    -1.1.2010.10.24
    -1.0.2010.10.19
 ]]
 
--[[
Conky Widgets by londonali1010 (2009)

This script is meant to be a "shell" to hold a suite of widgets for use in Conky.

To configure:
+ Copy the widget's code block (will be framed by --(( WIDGET NAME )) and --(( END WIDGET NAME )), with "[" instead of "(") somewhere between "require 'cairo'" and "function conky_widgets()", ensuring not to paste into another widget's code block
+ To call the widget, add the following between "cr = cairo_create(cs)" and "cairo_destroy(cr)" at the end of the script:
	NAME_OF_FUNCTION(cr, OPTIONS)
+ Replace OPTIONS with the options for your widget (should be specified in the widget's code block) 

Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/conky_widgets.lua):
	lua_load ~/scripts/conky_widgets.lua
	lua_draw_hook_pre widgets
	
Changelog:
+ v1.1 -- Simplified calls to widgets by implementing a global drawing surface, and included imlib2 by default (03.11.2009)
+ v1.0 -- Original release (17.10.2009)
]]

require 'cairo'
    
--[[ GUAGE CLOCK WIDGET VERSION 2 ]]
--[[ Options (xc, yc, size, clr, clr2, alp, thck):
 ]]

function guage_clockv2(cr, xc, yc, size, clr, clr2, alp, thck)
    local function rgb_to_r_g_b(colour,alpha)
        return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
    end
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)
    if update_num>5 then
        local offset = 0
        local clock_r = (size - 2 * offset) / (2 * 1.25)
        show_seconds=true
        -- Grab time
        local hours=os.date("%I")
        local mins=os.date("%M")
        local secs=os.date("%S")
        secs_arc=(2*math.pi/60)*secs
        mins_arc=(2*math.pi/60)*mins--+secs_arc/60
        hours_arc=(2*math.pi/12)*hours+mins_arc/12
        -- Background
            lp=0
            mark=(2*math.pi)/12
            repeat 
                xss=xc+0.61*clock_r*math.sin(mark+mark*lp)
                yss=yc-0.61*clock_r*math.cos(mark+mark*lp)
                xs=xc+1*clock_r*math.sin(mark+mark*lp)
                ys=yc-1*clock_r*math.cos(mark+mark*lp)
                cairo_move_to(cr,xss,yss)
                cairo_line_to(cr,xs,ys)
                tck=thck
                cairo_set_line_width(cr,tck)
                cairo_set_source_rgba(cr,rgb_to_r_g_b(clr,(alp*0.1)))
                cairo_stroke(cr)
                lp = lp + 1
            until lp >= 12
            lp=0
            mark=(2*math.pi)/60
            repeat 
                xss=xc+0.84*clock_r*math.sin(mark+mark*lp)
                yss=yc-0.84*clock_r*math.cos(mark+mark*lp)
                xs=xc+1*clock_r*math.sin(mark+mark*lp)
                ys=yc-1*clock_r*math.cos(mark+mark*lp)
                cairo_move_to(cr,xss,yss)
                cairo_line_to(cr,xs,ys)
                tck=thck
                cairo_set_line_width(cr,tck)
                cairo_set_source_rgba(cr,rgb_to_r_g_b(clr,(alp*0.1)))
                cairo_stroke(cr)
                lp = lp + 1
            until lp >= 60
        -- Draw hour hand
        th=2*math.pi
            xhs=xc+0.11*clock_r*math.sin(hours_arc-th)
            yhs=yc-0.11*clock_r*math.cos(hours_arc-th)
            xh=xc+0.75*clock_r*math.sin(hours_arc-th)
            yh=yc-0.75*clock_r*math.cos(hours_arc-th)
            cairo_move_to(cr,xhs,yhs)
            cairo_line_to(cr,xh,yh)
            cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
            cairo_set_line_width(cr,thck+thck*0.5)
            al=alp*0.5
            cairo_set_source_rgba(cr,rgb_to_r_g_b(clr,(al)))
            cairo_stroke(cr)
        -- Draw minute hand
        tm=(2*math.pi)
            xms=xc+0.11*clock_r*math.sin(mins_arc-tm)
            yms=yc-0.11*clock_r*math.cos(mins_arc-tm)
            xm=xc+0.95*clock_r*math.sin(mins_arc-tm)
            ym=yc-0.95*clock_r*math.cos(mins_arc-tm)
            cairo_move_to(cr,xms,yms)
            cairo_line_to(cr,xm,ym)
            tk=thck/2
            cairo_set_line_width(cr,tk)
            cairo_set_source_rgba(cr,rgb_to_r_g_b(clr,(alp)))
            cairo_stroke(cr)
        -- Draw seconds hand
        if show_seconds then
            ts=(2*math.pi)
                xss=xc+0.11*clock_r*math.sin(secs_arc-ts)
                yss=yc-0.11*clock_r*math.cos(secs_arc-ts)
                xs=xc+1*clock_r*math.sin(secs_arc-ts)
                ys=yc-1*clock_r*math.cos(secs_arc-ts)
                cairo_move_to(cr,xss,yss)
                cairo_line_to(cr,xs,ys)
                tck=thck/3
                cairo_set_line_width(cr,tck)
                cairo_set_source_rgba(cr,rgb_to_r_g_b(clr2,(alp))) 
                cairo_stroke(cr)
        end
    end
end
--[[ END GUAGE CLOCK WIDGET VERSION 2 ]]

function conky_widgets()
    
	if conky_window == nil then return end

    if cs == nil or cairo_xlib_surface_get_width(cs) ~= conky_window.width or cairo_xlib_surface_get_height(cs) ~= conky_window.height then
        if cs then cairo_surface_destroy(cs) end
        cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    end
    if cr then cairo_destroy(cr) end

    cr = cairo_create(cs)
    
    --[[ Following line draws the actual clockface. 
        guage_clockv2(cr, xc, yc, size, clr, clr2, alp, thck)
        options:
        xc: center x position, starting with top left of conky window
        yc: center y position, starting with top left of conky window
        size: overall size of clockface
        clr: color of the clock hands and hour/minute marks
        clr2: color of the seconds hand
        alp: overall alpha
        thck: starting thickness of any lines drawn
        ]]
            guage_clockv2(cr, 100, 90, 180, 0xFFFFFF, 0xFF0000, 1.0, 2)

    cairo_destroy(cr)
    cr = nil

end

function conky_cairo_cleanup()
    cairo_surface_destroy(cs)
    cs = nil
end
