workspace "vendor"
configurations { "Release" }
location "build"

project "CII"
location "build/vendor/CII"
kind "Makefile"

project "Lua 5.4.8"
location "build/vendor/Lua5.4.8"
kind "Makefile"

project "Lua 2.5.1"
location "build/vendor/Lua2.5.1"
kind "Makefile"
buildcommands {
  -- Apply patches
  "make %{buildcfg.cfg}"
}
