require "cairo"
require "imlib2"

-- определяем раздел home, для возможности работать с любого компьтера

usrhome = os.getenv("HOME")

-- необходимые скрипты

dofile (usrhome .."/.conky/.scripts_orange/backgraund.lua")
dofile (usrhome .."/.conky/.scripts_orange/clock_hands.lua")
dofile (usrhome .."/.conky/.scripts_orange/scale.lua")
dofile (usrhome .."/.conky/.scripts_orange/simple_text.lua")

function conky_widgets()

-- цвет для фона

bg_colour_1 = {{0, 0xd0d0d0, 1},{1, 0xc0c0c0, 1}}
bg_colour_2 = {{0, 0x000000,1},{0.5, 0xFF8C00, 1},{1, 0x000000, 1}}

-- индикаторы num-lock, caps, keyboard --------------------------------------

if conky_parse("${exec skb 1}") == "Rus" then textlang = "RUS" else textlang = "US" end

local d = conky_parse("${exec xset q | grep Num |awk '{print $4\" \"$8}'}")

local i = 1
local num_on = false
local caps_on = false

colour_num = 0x000000
colour_cap = 0x000000

for word in string.gmatch(d, "%a+") do
	if i == 1 and word == "on" then colour_cap = 0xc0c0c0 end
	if i == 2 and word == "on" then colour_num = 0xc0c0c0 end
	i = i + 1
end
-- ---------------------------------------------


--[[ backgraund data ]]

backgraund_settings={
-- numlock
{
x = 10,
y = 10,
width = 65,
height = 30,
bg_colour = bg_colour_1,
},

{
x = 11,
y = 11,
width = 63,
height = 28,
bg_colour = bg_colour_2,
},
--caplock
{
x = 80,
y = 10,
width = 65,
height = 30,
bg_colour = bg_colour_1,
},

{
x = 81,
y = 11,
width = 63,
height = 28,
bg_colour =  bg_colour_2,
},
-- keyboard
{
x = 150,
y = 10,
width = 65,
height = 30,
bg_colour = bg_colour_1,
},

{
x = 151,
y = 11,
width = 63,
height = 28,
bg_colour =  bg_colour_2,
},
-- mail symbol
{
x = 220,
y = 10,
width = 70,
height = 30,
bg_colour = bg_colour_1,
},

{
x = 221,
y = 11,
width = 68,
height = 28,
bg_colour =  bg_colour_2,
},
-- clock
{
x = 10,
y = 45,
width = 135,
height = 135,
bg_colour = bg_colour_1,
},

{
x = 11,
y = 46,
width = 133,
height = 133,
bg_colour =  bg_colour_2,
},
-- weather
{
x = 150,
y = 45,
width = 65,
height = 135,
bg_colour = bg_colour_1,
},

{
x = 151,
y = 46,
width = 63,
height = 133,
bg_colour =  bg_colour_2,
},
-- mail
{
x = 220,
y = 45,
width = 70,
height = 135,
bg_colour = bg_colour_1,
},

{
x = 221,
y = 46,
width = 68,
height = 133,
bg_colour =  bg_colour_2,
},
}
--[[ END backgraund data ]]
--[[ данные для часов ]]

clock_hands_settings = {	-- данные для вывода стрелок часов

{
x = 77,			-- координаты по горизонтали центра часов
y = 112,		-- координаты по вертикали центра часов
clock_r = 57,	-- радиус часов
-- координаты источника света относительно центра часов, 0 - источник света над центром
-- может быть положительным, источник света выше центра, или отрицательным
shadow_xoffset=70,	-- координаты источника света по горизонтали
shadow_yoffset=70,	-- координаты источника света по вертикали
shadow_opacity=0.5,	-- прозрачность тени, значения от 0 до 1
-- Выводить секундную стрелку, Да - true, Нет - false.
-- При выводе секундной стрелки update_interval в .conkyrc должен быть менее 1 сек.
show_seconds = true,	-- вывод секундной стрелки
show_dot = true,	-- Выводить ось стрелок в центре часов, Да - true, Нет - false.
-- размеры стрелок, первая цифра ширина, вторая - длина
rh = 2.5,		-- ширина часовой стрелки
lgh = 1.5,		-- длина часовой стрелки
rm = 2,			-- ширина минутной стрелки
lgm = 1.9,		-- длина минутной стрелки
rs = 1,			-- ширина секундной стрелки
lgs = 2.2,		-- длина секундной стрелки
},
}

--[[ END данных часов ]]
--[[ данные для шкал ]]

scale_settings = {

{
name = "",
arg = conky_parse("${weather http://weather.noaa.gov/pub/data/observations/metar/stations/ LBSF temperature 30}"),
max = 100,
x = 155,
y = 85,
w = 55,
h = 90,
scale = 20,	
font_size = 11,	
--font = "Ubuntu",
},
}

--[[ вывод текстов ]]

text_settings = {

{
text = "NUM",
x = 41,
y = 25,
font_size = 22,
bold = true,
h_align = "c",
v_align = "m",
colour = colour_num,
},

{
text = "CAP",
x = 111,
y = 25,
font_size = 22,
bold = true,
h_align = "c",
v_align = "m",
colour = colour_cap,
},

{
text = textlang,
x = 180,
y = 25,
font_size = 22,
bold = true,
h_align = "c",
v_align = "m",
colour = 0xc0c0c0,
},

{
text = "Weather",
x = 180,
y = 65,
font_size = 12,
bold = true,
h_align = "c",
v_align = "m",
colour = 0xc0c0c0,
},

{
text = "C°",
x = 205,
y = 95,
font_size = 10,
bold = true,
h_align = "c",
v_align = "m",
colour = 0xc0c0c0,

},
}

--[[ END ALL DATA ]]

	if conky_window == nil then return end
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)

--[[ BACKGRAUND ]]
	cr=cairo_create(cs)
	for i,v in pairs(backgraund_settings) do
		display_background(v)
	end
	cairo_destroy(cr)
--[[ ЧАСЫ ]]
	for i,v in pairs(clock_hands_settings) do
		cr = cairo_create (cs)
		display_clock(v)
		cairo_destroy(cr)
	end
--[[ ШКАЛЫ ]]
	for i,v in pairs(scale_settings) do    
	        cr = cairo_create (cs)
	        dialgraph(v)
	        cairo_destroy(cr)
	end
-- вывод текста
	for i,v in pairs(text_settings) do
		cr = cairo_create (cs)
		display_text(v)
		cairo_destroy(cr)
	end
end
