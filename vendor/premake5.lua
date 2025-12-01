workspace "vendor"
    configurations { "Debug", "Release" }
    location "build"

project "CII"
    files {
      "c-interfaces-and-implementations/**.[ch]"
    }

project "Lua"
    files {
      "lua-5.4.8/**.[ch]"
    }
