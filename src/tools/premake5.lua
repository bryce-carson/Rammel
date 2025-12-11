workspace "Rammel"
  configurations { "Debug", "Release" }
  location "build"
  result, errorcode = os.outputof "rpm --eval '%{_libexecdir}'"
  -- targetdir(result)

filter { "system:linux", "action:gmake" }
  buildoptions { "-std=c99", "-pedantic", "-Wall" }
  -- linkoptions { }

-- Requires CFLAGS, whatever they are. Linking requires LFLAGS.
project "l2htodo"
  kind "ConsoleApp"
  language "C"
  location "build/tools/l2htodo"
  files {
    "l2htodo.c"
  }

-- Requires CFLAGS, whatever they are. Linking requires LFLAGS.
-- /home/bryce/src/rammel/src/tools/build/tools/markup/bin/Debug
project "markup"
  kind "ConsoleApp"
  language "C"
  location "build/tools/markup"
  files {
    "markmain.*",
    "strsave.*",
    "markup.*",
    "errors.*",
    "getline.*",
    "columns.*"
  }

-- Requires CFLAGS, whatever they are. Linking requires LFLAGS.
project "nt"
  kind "ConsoleApp"
  language "C"
  location "build/tools/nt"
  files {
    "notangle.*",
    "getlines.*",
    "match.*",
    "modules.*",
    "modtrees.*",
    "strsave.*",
    "main.*",-- requires a patch, to make main return int explicitly
    "errors.*",
    "columns.*"
  }

-- Requires CFLAGS, whatever they are. Linking requires LFLAGS.
project "tie"
  kind "ConsoleApp"
  language "C"
  location "build/tools/tie"
  files {
    "tie.c"
  }

-- Requires CFLAGS, whatever they are. Linking requires LFLAGS.
-- Requires a patch such that it includes <string.h>
project "nocond"
  kind "ConsoleApp"
  language "C"
  location "build/tools/nocond"
  files {
    "nocond.c"
  }
