// Sidepaths for knowledge between Knock and Flesh.

/datum/heretic_knowledge/spell/apetra_vulnera
	name = "Apetra Vulnera"
	desc = "Grants you Apetra Vulnera, a spell \
		that causes heavy bleeding on all bodyparts of the victim that have more than 15 brute."
	gain_text = "Flesh opens, and blood spills. My master seeks sacrifice, and I shall appease."
	next_knowledge = list(
	/datum/heretic_knowledge/spell/blood_siphon,
	/datum/heretic_knowledge/void_cloak,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/apetra_vulnera
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/spell/opening_blast
	name = "Wave Of Desperation"
	desc = "Grants you Wave Of Desparation, a spell that cannot be casted uncuffed, \
		removes your restraints, and repels and knocks down adjacent people, casts secondary mansus grasp on everything nearby."
	gain_text = "My shackles undone in dark fury, their feeble bindings crumble before my power."
	next_knowledge = list(
	/datum/heretic_knowledge/summon/ashy,
	/datum/heretic_knowledge/void_cloak,
	)
	spell_to_add = /datum/action/cooldown/spell/aoe/knock_blast
	cost = 1
	route = PATH_SIDE
