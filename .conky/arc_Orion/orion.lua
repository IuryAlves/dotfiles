
package.path = "/home/linux/.conky/arc_Orion/?.lua" --chemin a adapter 
require 'rings_orion' --for scriptA.lua ".lua" is not required here
require 'bar_orion'

function conky_main()
     conky_main_bars()
     conky_main_rings()
end
