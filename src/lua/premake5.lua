if !configured then dofile ../premake5.lua end

--[[ The following two loops are probably outmoded by Premake5 itself.
for i in { "pipes.cfg", "sys.cfg", "noweb.cfg", "util.cfg", "list.nws", "set.nws" } do
  config = { path.join(output_directory, i) } -- add to table
end

for i in { "cat.nws", "stripconds.nws", "xchunks.nws", "lines.nws" } do
  filters = { path.join(output_directory, i) } -- add to table
end
--]]

configurations { "Debug", "Release" }
platforms { "Win32", "Win64", "Linux32", "Linux64" }

filter { "platforms:Win32" }
system "Windows"
architecture "x86"

filter { "platforms:Win64" }
system "Windows"
architecture "x86_64"

filter { "platforms:Linux32" }
system "Linux"
architecture "x86"

filter { "platforms:Linux64" }
system "Linux"
architecture "x86_64"
