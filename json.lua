-- scaffold geniefile for json

json_script = path.getabsolute(path.getdirectory(_SCRIPT))
json_root = path.join(json_script, "json")

json_includedirs = {
	path.join(json_script, "config"),
	json_root,
}

json_libdirs = {}
json_links = {}
json_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { json_includedirs }
	end,

	_add_defines = function()
		defines { json_defines }
	end,

	_add_libdirs = function()
		libdirs { json_libdirs }
	end,

	_add_external_links = function()
		links { json_links }
	end,

	_add_self_links = function()
		links { "json" }
	end,

	_create_projects = function()

project "json"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		json_includedirs,
	}

	defines {}

	files {
		path.join(json_script, "config", "**.h"),
		path.join(json_root, "**.h"),
		path.join(json_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
