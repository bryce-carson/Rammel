workspace "vendor"
    configurations { "Debug", "Release" }
    location "build"
    kind "Makefile"

-- TODO: rather than trying to build it myself, use the existing Makefile which
-- also supports Windows NT!
project "CII"

-- FIXME: testes/libs/lib22 fails to compile: -Wimplicit-function-declaration.
project "Lua"
    files {
      "lua-5.4.8/**.h",
      "lua-5.4.8/**.c"
    }
