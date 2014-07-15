--==============================================================================
--  clock.lua
--  author  : CAI
--  version : 20130526
--  license : Distributed under the terms of GNU GPL version 2 or later
--
--  analog clock algorythm
--  author  : ramzport (http://ramzport.blogspot.ru/2012/04/conkylua-1.html)
--==============================================================================

require 'cairo'

--------------------------------------------------------------------------------
--                                                                    clock DATA

function go_clock()
  if conky_window == nil then return end
  local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
  cr = cairo_create(cs)

  local nXCenter = conky_window.width/2
  local nYCenter = 130
  local nRadius = conky_window.width/2 - 15

  local nSecond = tonumber(os.date('%S'))
  local nMinute = tonumber(os.date('%M'))
  local nHour = tonumber(os.date('%I'))
  if nHour == 12 then nHour=0 end

  --CLOCK

  --numbers
  for i = 1, 12 do
    nTheta = math.rad(i*30)
    nXCoord = nXCenter + (nRadius+8)*math.sin(nTheta)
    nYCoord = nYCenter - (nRadius+8)*math.cos(nTheta)
    if i==12 then nXCoord=nXCoord-3 end
    fDrawTextCenter (nXCoord+1, nYCoord+6, i, 'DejaVu Sans Condensed', 14, 0, 1, 0x000000, 1, 0)
    fDrawTextCenter (nXCoord, nYCoord+5, i, 'DejaVu Sans Condensed', 14, 0, 1, 0x999999, 1, 0)
  end
  for i = 0, 12 do
    nTheta = math.rad(i*30)
    nXCoord = nXCenter + (nRadius-12)*math.cos(nTheta)
    nYCoord = nYCenter + (nRadius-12)*math.sin(nTheta)
    nXoCoord = nXCenter + (nRadius-4)*math.cos(nTheta)
    nYoCoord = nYCenter + (nRadius-4)*math.sin(nTheta)

    fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, 0x000000, 1, 2)
  end

  for i = 0, 60 do
    nTheta = math.rad(i*6)
    nXCoord = nXCenter + (nRadius-9)*math.cos(nTheta)
    nYCoord = nYCenter + (nRadius-9)*math.sin(nTheta)
    nXoCoord = nXCenter + (nRadius-5)*math.cos(nTheta)
    nYoCoord = nYCenter + (nRadius-5)*math.sin(nTheta)

    fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, 0x000000, 1, 1)
  end


  -- text on clock face
  fDrawTextCenter (nXCenter, nYCenter+30, '', 'DejaVu Sans Condensed', 9, 0, 0, 0x555555, 1, 0)

  -- hour
  nTheta = math.rad(270+nHour*30+nMinute/2)
  nXCoord = nXCenter+(nRadius-27)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-27)*math.sin(nTheta)
  nXoCoord = nXCenter-5*math.cos(nTheta)
  nYoCoord = nYCenter-5*math.sin(nTheta)

  fLine(nXoCoord+1, nYoCoord+1, nXCoord+2, nYCoord+2, 0x000000, 0.3, 5)

  cairo_set_line_width (cr, 5)
  cairo_set_source_rgba(cr, fRGBtoARGB(0x000000, 1))
  cairo_move_to(cr, nXoCoord, nYoCoord)
  cairo_line_to(cr, nXCoord, nYCoord)
  cairo_stroke(cr)

  nTheta = math.rad(270+nHour*30+nMinute/2)
  nXCoord = nXCenter+(nRadius-28)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-28)*math.sin(nTheta)
  nXoCoord = nXCenter-4*math.cos(nTheta)
  nYoCoord = nYCenter-4*math.sin(nTheta)

  fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, 0x555555, 1, 3)

  -- minute
  nTheta = math.rad(270+nMinute*6)
  nXCoord = nXCenter+(nRadius-17)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-17)*math.sin(nTheta)
  nXoCoord = nXCenter-5*math.cos(nTheta)
  nYoCoord = nYCenter-5*math.sin(nTheta)

  fLine(nXoCoord+1, nYoCoord+1, nXCoord+2, nYCoord+2, 0x000000, 0.3, 4)

  cairo_set_line_width (cr, 4)
  cairo_set_source_rgba(cr, fRGBtoARGB(0x000000, 1))
  cairo_move_to(cr, nXoCoord, nYoCoord)
  cairo_line_to(cr, nXCoord, nYCoord)
  cairo_stroke(cr)

  nTheta = math.rad(270+nMinute*6)
  nXCoord = nXCenter+(nRadius-18)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-18)*math.sin(nTheta)
  nXoCoord = nXCenter-4*math.cos(nTheta)
  nYoCoord = nYCenter-4*math.sin(nTheta)

  fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, 0x555555, 1, 2)

  -- second
  nTheta = math.rad(270+nSecond*6)
  nXCoord = nXCenter+(nRadius-7)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-7)*math.sin(nTheta)
  nXoCoord = nXCenter-10*math.cos(nTheta)
  nYoCoord = nYCenter-10*math.sin(nTheta)

  fLine(nXoCoord+1, nYoCoord+1, nXCoord+2, nYCoord+2, 0x000000, 0.3, 3)

  cairo_set_line_width (cr, 3)
  cairo_set_source_rgba(cr, fRGBtoARGB(0x000000, 1))
  cairo_move_to(cr, nXoCoord, nYoCoord)
  cairo_line_to(cr, nXCoord, nYCoord)
  cairo_stroke(cr)

  nTheta = math.rad(270+nSecond*6)
  nXCoord = nXCenter+(nRadius-8)*math.cos(nTheta)
  nYCoord = nYCenter+(nRadius-8)*math.sin(nTheta)
  nXoCoord = nXCenter-9*math.cos(nTheta)
  nYoCoord = nYCenter-9*math.sin(nTheta)

  fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, 0xffffff, 1, 1)

  -- glossy
  cairo_set_source_rgba(cr, fRGBtoARGB(0xffffff, 1))
  cairo_new_sub_path(cr)
  cairo_arc (cr, nXCenter, nYCenter, nRadius, math.rad(0), math.rad(360))

  local pLin = cairo_pattern_create_radial (nXCenter, nYCenter-50, 0, nXCenter, nYCenter-50, nRadius+55)
  cairo_pattern_add_color_stop_rgba (pLin, 0.0, fRGBtoARGB(0xffffff, 0.4))
  cairo_pattern_add_color_stop_rgba (pLin, 0.3, fRGBtoARGB(0xffffff, 0.1))
  cairo_pattern_add_color_stop_rgba (pLin, 1, fRGBtoARGB(0xffffff, 0.0))
  cairo_set_source (cr, pLin)
  cairo_fill(cr)
  cairo_pattern_destroy (pLin)
end

function fRGBtoARGB (nColor, nAlpha)
  return ((nColor / 0x10000) % 0x100) / 255., ((nColor / 0x100) % 0x100) / 255., (nColor % 0x100) / 255., nAlpha
end

function fDrawTextCenter (nXCenter, nYCenter, sText, sFontName, sFontSize, nFontSlant, nFontWeight, nColor, nAlpha, nRotate)
  local extents = cairo_text_extents_t:create()
  cairo_select_font_face (cr, sFontName, nFontSlant, nFontWeight)
  cairo_set_font_size (cr, sFontSize)
  cairo_text_extents (cr, sText, extents)
  local nXSpace = nXCenter-(extents.width/2)
  local nYSpace = nYCenter
  cairo_move_to (cr, nXSpace, nYSpace)
  cairo_set_source_rgba(cr, fRGBtoARGB (nColor, nAlpha))
  cairo_rotate (cr, nRotate*math.pi/180)
  cairo_show_text(cr, sText)
  cairo_rotate (cr, (0-nRotate)*math.pi/180)
end

function fLine(nXoCoord, nYoCoord, nXCoord, nYCoord, nColor, nAlpha, nWidthLine)
  cairo_set_source_rgba(cr, fRGBtoARGB(nColor, nAlpha))
  cairo_set_line_width (cr, nWidthLine)
  cairo_move_to(cr, nXoCoord, nYoCoord)
  cairo_line_to(cr, nXCoord, nYCoord)
  cairo_stroke(cr)
end

function fRoundRect (nXCoord, nYCoord, nWidth, nHeight, nRadius)
cairo_move_to(cr, nXCoord+nRadius, nYCoord)
cairo_line_to(cr, nXCoord+nWidth-nRadius, nYCoord)
cairo_arc (cr, nXCoord+nWidth-nRadius, nYCoord+nRadius, nRadius, math.rad(270), math.rad(360))
cairo_line_to(cr, nXCoord+nWidth, nYCoord+nHeight-nRadius)
cairo_arc (cr, nXCoord+nWidth-nRadius, nYCoord+nHeight-nRadius, nRadius, math.rad(0), math.rad(90))
cairo_line_to(cr, nXCoord+nRadius, nYCoord+nHeight)
cairo_arc (cr, nXCoord+nRadius, nYCoord+nHeight-nRadius, nRadius, math.rad(90), math.rad(180))
cairo_line_to(cr, nXCoord, nYCoord+nRadius)
cairo_arc (cr, nXCoord+nRadius, nYCoord+nRadius, nRadius, math.rad(180), math.rad(270))
end

-------------------------------------------------------------------------------
--                                                                         MAIN
function conky_main()
    if conky_window == nil then 
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    
    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)
    
    if update_num > 5 then
        go_clock()
    end
    
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end

