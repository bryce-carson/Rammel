;; print "...running the Premake5 Lua script in the \"c\" subdirectory..."
;; workspace "Rammel"
;; configurations { "Debug", "Release" }
;; project "Rammel"
;; kind "ConsoleApp"
;; language "C"

load "string"

-- $(OUTPUT)$(P)cargs.h: cargs.nw; $(NOTANGLE) cargs.nw $(TANGLEOPTS) -L"#line %L "\"cargs.nw"\"%N" -Rheader $(CPIF) $@
function tangle_header (notangle, web, options)
  cmd = string.format("%s %s.nw %s -L%s -Rheader | cpif", notangle, web, options, string.format([[#line %%L "%s.nw"%%N]], web))
  os.execute(cmd)
end
webs = {
  "cargs",     "columns",   "cpif",      "env-lua",   "errors",
  "fromascii", "getline",   "ipipe",     "ipipe-lua", "lua-help",
  "lua-main",  "markparse", "markup",    "match",     "misc-lua",
  "modtrees",  "modules",   "mpipe",     "mpipe-lua", "notangle",
  "noweb-lua", "nwbuffer",  "nwprocess", "nwtime",    "precompiled",
  "recognize", "stages",    "strsave",   "sys",       "util",
  "xpipe",     "xpipe-lua"
}

files { "*.nw" }
removefiles { "overview.nw", "readme.nw", "doc.nw" }
links { "cii" }
table.keys(_FILES)

for web in pairs(webs) do
  tangle_header(notangle_path, web, notangle_options)
  -- tangle_root(notangle_path, i, notangle_options)
end

--[["Rammel" Documentation]]
os.execute("cp doc.nw doc.tex")
--[[
$(OUTPUT)$(P)allcode.tex:	$(FILES)
	$(OUTPUT)$(P)no weave -ifilter "Stages.elide, 'hackers:*'" -n -index $(FILES) > $@
]]
os.execute(string.format([[
  no weave -ifilter "Stages.elide, 'hackers:*'" -n -index %s > allcode.tex
  ]], files))
os.execute()
[[
doc:	$(OUTPUT)$(P)doc.tex $(OUTPUT)$(P)allcode.tex
	pdflatex -output-directory=$(OUTPUT) doc.tex >$(NUL)
	pdflatex -output-directory=$(OUTPUT) doc.tex >$(NUL)
	pdflatex -output-directory=$(OUTPUT) doc.tex
]]
