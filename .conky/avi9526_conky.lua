--[[
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   Author:	Andy V. Dromaretsky
   Email:	Dromaretsky@gmail.com
   
   Date of creation:	2012-06-09
   Date of last modification:	2012-06-14
]]--
----------------------------------------------------------------------------------------------------
--[[
Where to get "Path" matrix:
1) Open Inkscape
2) In settings window set "allow relative coordinates" - on, "repeat commands" - off.
3) Draw some path.
4) Add nodes to this path (every node will be step of "path progress bar" - more nodes - better).
5) Set line type to linear (Inkscape use by default spline node connectors).
6) Save svg file and open it in text editor.
7) Find matrix corresponding to path that You make. It's looks like
...
d="m 340,364.36218 -1.25,-1.25 -1.25,-1.25 -1.25,-1.25 -1.25,-1.25 0,-1.5 0,-1.5 0,-1.5 0,-1.5 0,-1.5 0,-1.5 0,-1.5 0,-1.5 1.25,-1.25 1.25,-1.25 1.25,-1.25 1.25,-1.25"
...
8) Copy that line begining after "d="m 340,364.36218"  to new document (of course, numbers will be different).
9) Replace " " by "}
,{".
10) Next steps is obvious.
]]--
----------------------------------------------------------------------------------------------------
WidgetsData = {
	{
	Name = 'time',
	Title = '',
	Type = 'path',
	XY = {300, 600},
	Arg = '%S',
	MaxValue = 59,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x10D5FF,
	Col3 = 0x82FF10,
	Callout = {
		Prefix = '',
		Suffix = 's',
		Distance = 50,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {20, -20}
		},
	Path = {{1.1455,-0.0508},
		{1.0888,0.19956},
		{1.00842,0.42129},
		{0.90435,0.61439},
		{0.77659,0.77883},
		{0.62514,0.91464},
		{0.45001,1.0218},
		{0.25119,1.10032},
		{0.0216,1.39493},
		{-0.27497,1.32161},
		{-0.53794,1.2196},
		{-0.76732,1.0889},
		{-0.96312,0.92953},
		{-1.12532,0.74146},
		{-1.25394,0.5247},
		{-1.34898,0.27927},
		{-1.64421,-0.007},
		{-1.55453,-0.34985},
		{-1.43106,-0.65451},
		{-1.27378,-0.9205},
		{-1.08271,-1.14783},
		{-0.85784,-1.33648},
		{-0.59917,-1.48649},
		{-0.3067,-1.59781},
		{0.034,-1.89343},
		{0.42442,-1.78755},
		{0.77104,-1.64268},
		{1.07382,-1.45885},
		{1.33279,-1.23603},
		{1.54793,-0.97425},
		{1.71925,-0.67348},
		{1.84676,-0.33373},
		{2.14262,0.061},
		{2.02063,0.49879},
		{1.85443,0.88753},
		{1.64404,1.22723},
		{1.38945,1.51791},
		{1.09066,1.75956},
		{0.74768,1.95217},
		{0.36049,2.09577},
		{-0.0878,2.39181},
		{-0.57304,2.25376},
		{-1.00401,2.06627},
		{-1.3807,1.82931},
		{-1.70313,1.54292},
		{-1.9713,1.20709},
		{-2.1852,0.82179},
		{-2.34482,0.38705},
		{-2.64099,-0.11438},
		{-2.48694,-0.64719},
		{-2.27815,-1.12046},
		{-2.01465,-1.53422},
		{-1.69644,-1.88843},
		{-1.3235,-2.18313},
		{-0.89585,-2.41828},
		{-0.41348,-2.59391},
		{0.14081,-2.89018},
		{0.72126,-2.72013},
		{1.23692,-2.49009},
		{1.68776,-2.20003},
		{2.07379,-1.84999},
		{2.39502,-1.43992},
		{2.65142,-0.96986},
		{2.84302,-0.4398},
		{3.13936,0.16713},
		{2.95335,0.79529},
		{2.70206,1.35337},
		{2.38546,1.84133},
		{2.00355,2.25919},
		{1.55635,2.60694},
		{1.04384,2.8846},
		{0.46603,3.09215},
		{-0.19337,3.38854},
		{-0.86928,3.1866},
		{-1.46981,2.91406},
		{-1.99491,2.5709},
		{-2.44462,2.15714},
		{-2.81891,1.67276},
		{-3.11781,1.1178},
		{-3.34129,0.4922},
		{-3.63773,-0.21954},
		{-3.41986,-0.94325},
		{-3.12608,-1.58623},
		{-2.75637,-2.14852},
		{-2.31073,-2.63007},
		{-1.78919,-3.03091},
		{-1.19172,-3.35104},
		{-0.51832,-3.59044},
		{0.24566,-3.88691},
		{1.01719,-3.65313},
		{1.70267,-3.33812},
		{2.30212,-2.94185},
		{2.81555,-2.46435},
		{3.24293,-1.90561},
		{3.58428,-1.26563},
		{3.8396,-0.5444}},
	PathMultiplier = {2, 2}
	},
	{
	Name = 'time',
	Title = '',
	Type = 'path',
	XY = {200, 600},
	Arg = '%M.%S',
	MaxValue = 59,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x82FF10,
	Col3 = 0xDBFF10,
	Callout = {
		Prefix = '',
		Suffix = 'm',
		Distance = 50,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {20, -20}
		},
	Path = {{1.1455,-0.0508},
		{1.0888,0.19956},
		{1.00842,0.42129},
		{0.90435,0.61439},
		{0.77659,0.77883},
		{0.62514,0.91464},
		{0.45001,1.0218},
		{0.25119,1.10032},
		{0.0216,1.39493},
		{-0.27497,1.32161},
		{-0.53794,1.2196},
		{-0.76732,1.0889},
		{-0.96312,0.92953},
		{-1.12532,0.74146},
		{-1.25394,0.5247},
		{-1.34898,0.27927},
		{-1.64421,-0.007},
		{-1.55453,-0.34985},
		{-1.43106,-0.65451},
		{-1.27378,-0.9205},
		{-1.08271,-1.14783},
		{-0.85784,-1.33648},
		{-0.59917,-1.48649},
		{-0.3067,-1.59781},
		{0.034,-1.89343},
		{0.42442,-1.78755},
		{0.77104,-1.64268},
		{1.07382,-1.45885},
		{1.33279,-1.23603},
		{1.54793,-0.97425},
		{1.71925,-0.67348},
		{1.84676,-0.33373},
		{2.14262,0.061},
		{2.02063,0.49879},
		{1.85443,0.88753},
		{1.64404,1.22723},
		{1.38945,1.51791},
		{1.09066,1.75956},
		{0.74768,1.95217},
		{0.36049,2.09577},
		{-0.0878,2.39181},
		{-0.57304,2.25376},
		{-1.00401,2.06627},
		{-1.3807,1.82931},
		{-1.70313,1.54292},
		{-1.9713,1.20709},
		{-2.1852,0.82179},
		{-2.34482,0.38705},
		{-2.64099,-0.11438},
		{-2.48694,-0.64719},
		{-2.27815,-1.12046},
		{-2.01465,-1.53422},
		{-1.69644,-1.88843},
		{-1.3235,-2.18313},
		{-0.89585,-2.41828},
		{-0.41348,-2.59391},
		{0.14081,-2.89018},
		{0.72126,-2.72013},
		{1.23692,-2.49009},
		{1.68776,-2.20003},
		{2.07379,-1.84999},
		{2.39502,-1.43992},
		{2.65142,-0.96986},
		{2.84302,-0.4398},
		{3.13936,0.16713},
		{2.95335,0.79529},
		{2.70206,1.35337},
		{2.38546,1.84133},
		{2.00355,2.25919},
		{1.55635,2.60694},
		{1.04384,2.8846},
		{0.46603,3.09215},
		{-0.19337,3.38854},
		{-0.86928,3.1866},
		{-1.46981,2.91406},
		{-1.99491,2.5709},
		{-2.44462,2.15714},
		{-2.81891,1.67276},
		{-3.11781,1.1178},
		{-3.34129,0.4922},
		{-3.63773,-0.21954},
		{-3.41986,-0.94325},
		{-3.12608,-1.58623},
		{-2.75637,-2.14852},
		{-2.31073,-2.63007},
		{-1.78919,-3.03091},
		{-1.19172,-3.35104},
		{-0.51832,-3.59044},
		{0.24566,-3.88691},
		{1.01719,-3.65313},
		{1.70267,-3.33812},
		{2.30212,-2.94185},
		{2.81555,-2.46435},
		{3.24293,-1.90561},
		{3.58428,-1.26563},
		{3.8396,-0.5444}},
	PathMultiplier = {2, 2}
	},
	{
	Name = 'time',
	Title = '',
	Type = 'path',
	XY = {100, 600},
	Arg = '%H.%M',
	MaxValue = 23,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xDBFF10,
	Col3 = 0xFFDC10,
	Callout = {
		Prefix = '',
		Suffix = 'h',
		Distance = 50,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {20, -20}
		},
	Path = {{1.1455,-0.0508},
		{1.0888,0.19956},
		{1.00842,0.42129},
		{0.90435,0.61439},
		{0.77659,0.77883},
		{0.62514,0.91464},
		{0.45001,1.0218},
		{0.25119,1.10032},
		{0.0216,1.39493},
		{-0.27497,1.32161},
		{-0.53794,1.2196},
		{-0.76732,1.0889},
		{-0.96312,0.92953},
		{-1.12532,0.74146},
		{-1.25394,0.5247},
		{-1.34898,0.27927},
		{-1.64421,-0.007},
		{-1.55453,-0.34985},
		{-1.43106,-0.65451},
		{-1.27378,-0.9205},
		{-1.08271,-1.14783},
		{-0.85784,-1.33648},
		{-0.59917,-1.48649},
		{-0.3067,-1.59781},
		{0.034,-1.89343},
		{0.42442,-1.78755},
		{0.77104,-1.64268},
		{1.07382,-1.45885},
		{1.33279,-1.23603},
		{1.54793,-0.97425},
		{1.71925,-0.67348},
		{1.84676,-0.33373},
		{2.14262,0.061},
		{2.02063,0.49879},
		{1.85443,0.88753},
		{1.64404,1.22723},
		{1.38945,1.51791},
		{1.09066,1.75956},
		{0.74768,1.95217},
		{0.36049,2.09577},
		{-0.0878,2.39181},
		{-0.57304,2.25376},
		{-1.00401,2.06627},
		{-1.3807,1.82931},
		{-1.70313,1.54292},
		{-1.9713,1.20709},
		{-2.1852,0.82179},
		{-2.34482,0.38705},
		{-2.64099,-0.11438},
		{-2.48694,-0.64719},
		{-2.27815,-1.12046},
		{-2.01465,-1.53422},
		{-1.69644,-1.88843},
		{-1.3235,-2.18313},
		{-0.89585,-2.41828},
		{-0.41348,-2.59391},
		{0.14081,-2.89018},
		{0.72126,-2.72013},
		{1.23692,-2.49009},
		{1.68776,-2.20003},
		{2.07379,-1.84999},
		{2.39502,-1.43992},
		{2.65142,-0.96986},
		{2.84302,-0.4398},
		{3.13936,0.16713},
		{2.95335,0.79529},
		{2.70206,1.35337},
		{2.38546,1.84133},
		{2.00355,2.25919},
		{1.55635,2.60694},
		{1.04384,2.8846},
		{0.46603,3.09215},
		{-0.19337,3.38854},
		{-0.86928,3.1866},
		{-1.46981,2.91406},
		{-1.99491,2.5709},
		{-2.44462,2.15714},
		{-2.81891,1.67276},
		{-3.11781,1.1178},
		{-3.34129,0.4922},
		{-3.63773,-0.21954},
		{-3.41986,-0.94325},
		{-3.12608,-1.58623},
		{-2.75637,-2.14852},
		{-2.31073,-2.63007},
		{-1.78919,-3.03091},
		{-1.19172,-3.35104},
		{-0.51832,-3.59044},
		{0.24566,-3.88691},
		{1.01719,-3.65313},
		{1.70267,-3.33812},
		{2.30212,-2.94185},
		{2.81555,-2.46435},
		{3.24293,-1.90561},
		{3.58428,-1.26563},
		{3.8396,-0.5444}},
	PathMultiplier = {2, 2}
	},
	{
	Name = 'cpu',
	Title = '',
	Type = 'path',
	XY = {50, 340},
	Arg = 'cpu0',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x8FF000,
	Col3 = 0xFDE000,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'cpu',
	Title = '',
	Type = 'path',
	XY = {65, 340},
	Arg = 'cpu1',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x8FF000,
	Col3 = 0xFDE000,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{1.125,-1.125},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-2.5},
		{0,-2.5},
		{0,-2.5},
		{0,-2.5},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375},
		{1.375,-1.375}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'cpu',
	Title = '',
	Type = 'path',
	XY = {80, 340},
	Arg = 'cpu2',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x8FF000,
	Col3 = 0xFDE000,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{1,-1},
		{1,-1},
		{1,-1},
		{1,-1},
		{1,-1},
		{1,-1},
		{1,-1},
		{1,-1},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-2},
		{0,-2},
		{0,-2},
		{0,-2},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5},
		{1.5,-1.5}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'cpu',
	Title = '',
	Type = 'path',
	XY = {95, 340},
	Arg = 'cpu3',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x8FF000,
	Col3 = 0xFDE000,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{1.75,-1.75},
		{1.75,-1.75},
		{1.75,-1.75},
		{1.75,-1.75},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{0,-2.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625},
		{1.625,-1.625}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'memperc',
	Title = 'RAM',
	Type = 'path',
	XY = {160, 200},
	Arg = '',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xF0D300,
	Col3 = 0xFDA100,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{0,-0.97503},
		{0,-0.97504},
		{0,-0.97503},
		{0,-0.97503},
		{0,-0.97504},
		{0,-0.97503},
		{0,-0.97504},
		{0,-0.97503},
		{0,-0.97503},
		{0,-0.975037},
		{0,-0.975034},
		{0,-0.975034},
		{0,-0.975034},
		{0,-0.975034},
		{0,-0.975033},
		{0,-0.975034},
		{0.972272,0},
		{0.972272,0},
		{0.972272,0},
		{0.972272,0},
		{0.972271,0},
		{0.972272,0},
		{0.972272,0},
		{0.972272,0},
		{0,0.707107},
		{0,0.707106},
		{0,0.707107},
		{0,0.707107}},
	PathMultiplier = {2, 2}
	},
	{
	Name = 'swapperc',
	Title = 'SWAP',
	Type = 'path',
	XY = {160, 240},
	Arg = '',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xFF70FD,
	Col3 = 0xFF00FC,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{1.313548,0.454909},
		{1.439247,0.377154},
		{1.492012,0.259873},
		{1.471844,0.103067},
		{1.378744,-0.09327},
		{1.212709,-0.329122},
		{0.973743,-0.604504},
		{0.661843,-0.919413},
		{0.274962,-1.058162},
		{-0.127029,-0.924849},
		{-0.458059,-0.80962},
		{-0.718132,-0.712475},
		{-0.907245,-0.633414},
		{-1.0254,-0.572439},
		{-1.072596,-0.529546},
		{-1.048832,-0.504738},
		{-0.82832,-0.384515},
		{-0.888186,-0.405121},
		{-0.887387,-0.45125},
		{-0.825922,-0.5229},
		{-0.703793,-0.620073},
		{-0.520997,-0.742767},
		{-0.277537,-0.890983},
		{0.02659,-1.064721},
		{0.387217,-1.030967},
		{0.72178,-0.778232},
		{0.993161,-0.533783},
		{1.201356,-0.29762},
		{1.346369,-0.06974},
		{1.428197,0.149846},
		{1.446841,0.36115},
		{1.402302,0.564166}},
	PathMultiplier = {2, 2}
	},
	{
	Name = 'downspeedf',
	Title = 'Donwload',
	Type = 'path',
	XY = {300, 350},
	Arg = 'eth0',
	MaxValue = 12000,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0x60B5F6,
	Col3 = 0x0091FF,
	Callout = {
		Prefix = '',
		Suffix = 'kB/s',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'upspeedf',
	Title = 'Upload',
	Type = 'path',
	XY = {292, 326},
	Arg = 'eth0',
	MaxValue = 12000,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xCCFF80,
	Col3 = 0xACFF00,
	Callout = {
		Prefix = '',
		Suffix = 'kB/s',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{0,-1.5},
		{0,-1.5},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{0,-1.75},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{0,-1.5},
		{-1,-1.25},
		{-1,-1.25},
		{-1,-1.25},
		{-1,-1.25}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'fs_used_perc',
	Title = 'Root',
	Type = 'path',
	XY = {170, 400},
	Arg = '/',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xFF5C00,
	Col3 = 0xFF2C00,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,0},
		{1.25,0},
		{1.25,0},
		{1.25,0},
		{1.25,1.25},
		{1.25,1.25},
		{1.25,1.25},
		{1.25,1.25},
		{0,1.25},
		{0,1.25},
		{0,1.25},
		{0,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,0},
		{-1.25,0},
		{-1.25,0},
		{-1.25,0}},
	PathMultiplier = {4, 4}
	},
	{
	Name = 'fs_used_perc',
	Title = 'Home',
	Type = 'path',
	XY = {230, 420},
	Arg = '/home',
	MaxValue = 100,
	LineWidth1 = 8,
	LineWidth2 = 4,
	Col1 = 0x000000,
	Col1Alpha = 0.5,
	Col2 = 0xFFEB00,
	Col3 = 0xFFDA00,
	Callout = {
		Prefix = '',
		Suffix = '%',
		Distance = 0,
		LineWidth = 2,
		LineColor = 0xFFFFFF,
		TextColor = 0x1A1A1A,
		LineAlpha = 0.8,
		TextAlpha = 0.9,
		FontName = 'Ubuntu',
		FontSize = 12,
		dXY = {10, -10}
		},
	Path = {{0,1.25},
		{0,1.25},
		{0,1.25},
		{0,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,1.25},
		{-1.25,0},
		{-1.25,0},
		{-1.25,0},
		{-1.25,0},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{-1.25,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{0,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,-1.25},
		{1.25,0},
		{1.25,0},
		{1.25,0},
		{1.25,0}},
	PathMultiplier = {4, 4}
	}
}
----------------------------------------------------------------------------------------------------
-- Include libraries
require 'cairo'
----------------------------------------------------------------------------------------------------
function hex2red(HexCol)
	return	((HexCol / 0x10000) % 0x100) / 255.
end
----------------------------------------------------------------------------------------------------
function hex2green(HexCol)
	return	((HexCol / 0x100) % 0x100) / 255.
end
----------------------------------------------------------------------------------------------------
function hex2blue(HexCol)
	return	(HexCol % 0x100) / 255.
end
----------------------------------------------------------------------------------------------------
function DrawWidgetPath(XY, Title, Value, MaxValue, LineWidth1, LineWidth2, Col1, Col2, Col3, Col1Alpha, Path, PathMultiplier, Callout)
	
	local PathLen = table.getn(Path)

	-- Create cairo drawing context
	CairoContext = cairo_create(CairoSurface)
	-- Draw
	cairo_set_line_cap(CairoContext, CAIRO_LINE_CAP_ROUND)
	cairo_set_line_join(CairoContext, CAIRO_LINE_JOIN_ROUND)
	cairo_set_line_width(CairoContext, LineWidth1)
	local RefPoint = {0, 0}
	RefPoint[1] = XY[1]
	RefPoint[2] = XY[2]
	cairo_move_to(CairoContext, RefPoint[1], RefPoint[2])
	for i = 1, PathLen do
		RefPoint[1] = RefPoint[1] + Path[i][1]*PathMultiplier[1]
		RefPoint[2] = RefPoint[2] + Path[i][2]*PathMultiplier[2]
		cairo_line_to(CairoContext, RefPoint[1], RefPoint[2])
	end
	cairo_set_source_rgba(CairoContext, hex2red(Col1), hex2green(Col1), hex2blue(Col1), Col1Alpha)
	cairo_stroke(CairoContext)
	cairo_set_line_width(CairoContext, LineWidth2)
	RefPoint[1] = XY[1]
	RefPoint[2] = XY[2]	
	local k1 = 0
	local k2 = 0
	local k3 = 0
	
	local ValuePathLen = ((Value*PathLen) / MaxValue)
	if ValuePathLen > PathLen
	then
		ValuePathLen = PathLen
	end
	for i = 1, ValuePathLen do
		cairo_move_to(CairoContext, RefPoint[1], RefPoint[2])
		RefPoint[1] = RefPoint[1] + Path[i][1]*PathMultiplier[1]
		RefPoint[2] = RefPoint[2] + Path[i][2]*PathMultiplier[2]
		cairo_line_to(CairoContext, RefPoint[1], RefPoint[2])
		k2 = i/PathLen
		k1 = 1 - k2
		k3 = k1 + k2
		cairo_set_source_rgba(CairoContext,
			(hex2red(Col2)*k1+hex2red(Col3)*k2)/k3,
			(hex2green(Col2)*k1+hex2green(Col3)*k2)/k3,
			(hex2blue(Col2)*k1+hex2blue(Col3)*k2)/k3,
			1)
		cairo_stroke(CairoContext)
	end
	
	if (Callout['Distance'] ~= 0)
	then
		RefPoint[1] = XY[1]
		RefPoint[2] = XY[2]	
		cairo_set_source_rgba(
			CairoContext,
			hex2red(Callout['LineColor']),
			hex2green(Callout['LineColor']),
			hex2blue(Callout['LineColor']),
			Callout['LineAlpha']
			)
		cairo_set_line_width(CairoContext, Callout['LineWidth'])
		cairo_move_to(CairoContext, RefPoint[1], RefPoint[2])
		RefPoint[1] = RefPoint[1] + Callout['dXY'][1]
		RefPoint[2] = RefPoint[2] + Callout['dXY'][2]
		cairo_line_to(CairoContext, RefPoint[1], RefPoint[2])
		RefPoint[1] = XY[1] + Callout['Distance']
		RefPoint[2] = RefPoint[2]
		cairo_line_to(CairoContext, RefPoint[1], RefPoint[2])
		cairo_stroke(CairoContext)
		
		local TextExt = cairo_text_extents_t:create()
		cairo_set_source_rgba(
			CairoContext,
			hex2red(Callout['TextColor']),
			hex2green(Callout['TextColor']),
			hex2blue(Callout['TextColor']),
			Callout['TextAlpha']
			)
		cairo_select_font_face (CairoContext, Callout['FontName'], CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
		cairo_set_font_size (CairoContext, Callout['FontSize'])
		local Str = Callout['Prefix'] .. tostring(math.floor(Value)) .. Callout['Suffix']
		cairo_text_extents (CairoContext, Str, TextExt)

		if Callout['Distance'] > 0
		then
			RefPoint[1] = RefPoint[1] - TextExt.width
		end
		cairo_move_to(CairoContext, RefPoint[1], RefPoint[2] - Callout['LineWidth'])
		cairo_show_text(CairoContext, Str)
	end

	-- Destroy cairo drawing context
	cairo_destroy(CairoContext)
	CairoContext = nil
end
----------------------------------------------------------------------------------------------------
function GetValue(Type, Name)
	local Str = ''
	local Value = 0
	Str = conky_parse(string.format('${%s %s}', Type, Name))
	return tonumber(Str)
end
----------------------------------------------------------------------------------------------------
-- Main function
function conky_Widgets()
	-- Check if conky window exist
	if conky_window == nil
	then
		return
	end
	-- Create XLib CairoSurface to draw widgets
	if (CairoSurface == nil)	-- check if exist
	then
		CairoSurface = cairo_xlib_surface_create(	-- create new surface with appropriate settings
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height)
	else
		-- Check if existed surface has size that equal to conky window size
		if (cairo_xlib_surface_get_width(CairoSurface) ~= conky_window.width) or
			(cairo_xlib_surface_get_height(CairoSurface) ~= conky_window.height)
		then
			-- Need recreate surface because resize function is not available
			cairo_surface_destroy(CairoSurface)
			CairoSurface = cairo_xlib_surface_create(
				conky_window.display,
				conky_window.drawable,
				conky_window.visual,
				conky_window.width,
				conky_window.height)
		end
	end

	-- Create cairo drawing context
	CairoContext = cairo_create(CairoSurface)
	-- Draw
	cairo_set_line_cap(CairoContext, CAIRO_LINE_CAP_ROUND)
	cairo_set_line_join(CairoContext, CAIRO_LINE_JOIN_ROUND)
	cairo_set_line_width(CairoContext, 4)

	cairo_set_source_rgba(CairoContext, 1, 1, 1, 0.1)
	cairo_rectangle(CairoContext, 0, 0, conky_window.width, conky_window.height)
	cairo_fill(CairoContext)
	cairo_rectangle(CairoContext, 0, 0, conky_window.width, conky_window.height)
	cairo_stroke(CairoContext)
	-- Destroy cairo drawing context
	cairo_destroy(CairoContext)
	CairoContext = nil

	local Str = ''
	local Value = 0
	-- Draw widgets
	for i in pairs(WidgetsData) do
		if WidgetsData[i]['Type'] == 'path'
		then
			Value = GetValue(WidgetsData[i]['Name'], WidgetsData[i]['Arg'])
			Str = ''
			DrawWidgetPath(
				WidgetsData[i]['XY'],
				WidgetsData[i]['Title'],
				Value,
				WidgetsData[i]['MaxValue'],
				WidgetsData[i]['LineWidth1'],
				WidgetsData[i]['LineWidth2'],
				WidgetsData[i]['Col1'],
				WidgetsData[i]['Col2'],
				WidgetsData[i]['Col3'],
				WidgetsData[i]['Col1Alpha'],
				WidgetsData[i]['Path'],
				WidgetsData[i]['PathMultiplier'],
				WidgetsData[i]['Callout']
				)
		end
	end
end
----------------------------------------------------------------------------------------------------
-- Clear variables
function conky_cairo_cleanup()
	if (CairoContext ~= nil)
	then
		cairo_destroy(CairoContext)
		CairoContext = nil
	end
	if (CairoSurface ~= nil)
	then
		cairo_surface_destroy(CairoSurface)
		CairoSurface = nil
	end
end
----------------------------------------------------------------------------------------------------

