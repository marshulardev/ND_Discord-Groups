local config <const> = require 'data.config'

local function assignGroup(character)
    local roles = character.discord.roles
	for role, v in pairs(config.roles) do
		local hasRole = lib.table.contains(roles, ("%s"):format(role))
		for _, k in pairs(v) do
			local group = character.getGroup(k.group)
			local restricted = k.job
			if hasRole and not group and not restricted then
				character.addGroup(k.group, k.rank)
				if config.debug then print(("Assigned Group: %s (#%s) to ID: %s"):format(k.group, k.rank, character.source)) end
			elseif hasRole and not group and restricted then
				if restricted == character.job then
					character.addGroup(k.group, k.rank)
					if config.debug then print(("Assigned Group: %s (#%s) to ID: %s"):format(k.group, k.rank, character.source)) end
				end
			end
		end
	end
end

AddEventHandler('ND:characterLoaded', assignGroup)