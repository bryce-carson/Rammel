print "...running the Premake5 Lua script in the \"c\" subdirectory..."

workspace "Rammel"
    configurations { "Debug", "Release" }
    kind "ConsoleApp"
    language "C"
    targetdir "bin/%{cfg.buildcfg}"
    location "build"

filter "system:Windows"
    system "windows"

filter "system:linux"
    system "linux"
    linker "ld"

-- sub-projects
-- tangle_ch_file("example") :: notangle example.nw > example.c# tangle the default * module.
function tangle_ch_file (name, root, of, mode, tangleopts)
  if not root and not of then
    of = string.format("%s.c", name)
  end
  if not of then
    of = string.format("%s.h", name)
  end
  if root then
    root = string.format("-R%s", root)
  else
    root = ""
  end
  if not mode then
    mode = ">"
  else-- I only ever use "a+" to indicate that I intend to append.
    mode = ">>"
  end

  if not tangleopts then tangleopts = "" end

  os.executef([[notangle %s.nw %s -L"#line %%L "\"%s.nw"\"%%N" %s CPIF %s %s %s]],
    name, tangleopts, name, root, of, mode, of)
end

for header in pairs({
    "cargs",       "columns",
    "cpif",        "env-lua",
    "errors",      "fromascii",
    "getline",     "ipipe",
    "ipipe-lua",   "lua-help",
    "lua-main",    "markparse",
    "markup",      "match",
    "misc-lua",    "modtrees",
    "modules",     "mpipe",
    "mpipe-lua",   "notangle",
    "noweb-lua",   "nwbuffer",
    "nwprocess",   "nwtime",
    "precompiled", "recognize",
    "stages",      "strsave",
    "sys",         "util",
    "xpipe",       "xpipe-lua"
}) do tangle_ch_file(header, "header") end

for source in pairs({
    "columns",   "cpif",
    "errors",    "env-lua",
    "finduses",  "fromascii",
    "getline",   "ipipe",
    "ipipe-lua", "lua-help",
    "lua-main",  "main",
    "markup",    "markparse",
    "misc-lua",  "modtrees",
    "modules",   "mpipe",
    "mpipe-lua", "notangle",
    "noweb-lua", "nwbuffer",
    "nwprocess", "nwmtime",
    "nwtime",    "recognize",
    "stages",    "strsave",
    "sys",       "util",
    "xpipe",     "xpipe-lua"
}) do tangle_ch_file(source) end

project "columns"
    files { "cargs.h", "columns.c", "columns.h" }
project "cpif"
    files { "cpif.c", "cpif.h", "errors.h", "strsave.h" }
project "env-lua"
    files { "env-lua.c", "env-lua.h", "lua-help.h" }
project "errors"
    files { "errors.c", "errors.h" }
project "finduses"
    files { "errors.h", "finduses.c", "getline.h", "match.h", "nwbuffer.h", "recognize.h" }
project "fromascii"
    files { "errors.h", "fromascii.c", "fromascii.h", "getline.h", "nwbuffer.h" }
project "getline"
    files { "columns.h", "errors.h", "getline.c", "getline.h" }
project "ipipe"
    files { "ipipe.c", "ipipe.h", "nwbuffer.h", "nwtime.h" }
project "ipipe-lua"
    files { "ipipe-lua.c", "ipipe-lua.h" }
project "lua-help"
    files { "lua-help.c", "lua-help.h" }
project "lua-main"
    files { "env-lua.h", "ipipe-lua.h", "lua-main.c", "lua-main.h", "misc-lua.h", "mpipe-lua.h", "noweb-lua.h", "stages.h", "util.h", "xpipe-lua.h" }
project "main"
    files { "cargs.h", "columns.h", "cpif.h", "errors.h", "main.c", "modtrees.h", "modules.h", "notangle.h", "nwbuffer.h" }
project "markparse"
    files { "columns.h", "errors.h", "getline.h", "markparse.c", "markparse.h", "markup.h", "nwbuffer.h" }
project "markup"
    files { "errors.h", "markup.c", "markup.h", "strsave.h" }
project "misc-lua"
    files { "lua-help.h", "misc-lua.c", "misc-lua.h" }
project "modtrees"
    files { "errors.h", "modtrees.c", "modtrees.h", "modules.h", "strsave.h" }
project "modules"
    files { "columns.h", "errors.h", "modtrees.h", "modules.c", "modules.h", "strsave.h" }
project "mpipe"
    files { "fromascii.h", "ipipe.h", "mpipe.c", "mpipe.h", "nwbuffer.h", "xpipe.h" }
project "mpipe-lua"
    files { "lua-help.h", "mpipe.h", "mpipe-lua.c", "mpipe-lua.h" }
project "notangle"
    files { "errors.h", "getline.h", "match.h", "modtrees.h", "modules.h", "notangle.c", "notangle.h", "nwbuffer.h", "strsave.h" }
project "noweb-lua"
    files { "lua-help.h", "noweb-lua.c", "noweb-lua.h", "util.h" }
project "nwbuffer"
    files { "nwbuffer.c", "nwbuffer.h" }



--[[Generating nwbuffer-lua.c is a nightmare in the original sources.]]
local nwbufferlua = os.tmpname()
os.executef("{COPYFILE} nobuffer-lua.nw %s", nwbufferlua)
io.open(nwbufferlua, "a+")
io.output(nwbufferlua):write("<<key macros>>=\n")
nwbufferlua:close()
tangle_ch_file("nwbuffer", "key macros", nwbufferlua, "a+")
io.open(nwbufferlua, "a+")
io.write("@\n")
nwbufferlua:close()
tangle_ch_file(nwbufferlua, "*", "build/nwbuffer-lua.c")
project "nwbuffer-lua"
    files { "lua-help.h", "nwbuffer.h", "nwbuffer-lua.c" }



project "nwmtime"
    files { "getline.h", "nwmtime.c" }
project "nwprocess"
    files { "nwprocess.c", "nwprocess.h" }
project "nwtime"
    files { "nwtime.c", "nwtime.h" }
project "recognize"
    files { "recognize.c" }
project "stages"
    files { "cargs.h", "fromascii.h", "lua-help.h", "markparse.h", "notangle.h", "nwbuffer.h", "stages.c", "stages.h" }
project "strsave"
    files { "errors.h", "strsave.c", "strsave.h" }
project "sys"
    files { "sys.c", "sys.h" }
project "util"
    files { "precompiled.h", "sys.h", "util.c", "util.h" }
project "xpipe"
    files { "errors.h", "nwprocess.h", "sys.h", "util.h", "xpipe.c", "xpipe.h" }
project "xpipe-lua"
    files { "cargs.h", "lua-help.h", "xpipe.h", "xpipe-lua.c", "xpipe-lua.h" }

-- Vendored projects linked against are defined in ../../vendor/premake5.lua
project "no"
    links { "CII", "Lua"}
    links {
      "columns",   "cpif",
      "env-lua",   "errors",
      "finduses",  "fromascii",
      "getline",   "ipipe",
      "ipipe-lua", "lua-help",
      "lua-main",  "main",
      "markparse", "markup",
      "misc-lua",  "modtrees",
      "modules",   "mpipe",
      "mpipe-lua", "notangle",
      "noweb-lua", "nwbuffer",
      "nwbuffer-", "nwprocess",
      "nwtime",    "recognize",
      "stages",    "strsave",
      "sys",       "util",
      "xpipe",     "xpipe-lua"
    }

project "nwmtime"
    links {
      "columns",
      "errors",
      "getline",
      "nwmtime"
    }
