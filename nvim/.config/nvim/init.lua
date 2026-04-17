local profile = require("profiles")

if profile.current == "full" then
	require("profiles.full")
else
	require("profiles.lite")
end
