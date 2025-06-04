local config = {}

config.debug = false

config.roles = {
	[1198494975697096764] = {
		{group = 'ballas', rank = 1, job = false},
		{group = 'swat', rank = 1, job = 'police'}, -- if you add a job, the player wont be able to get the group without having the job.
	},

	-- [DISCORD ROLE ID] = {
	-- 	{group = 'ballas', rank = 1, job = false}
	-- },
}

return config