/datum/job/roguetown/vagrant
	title = "Beggar"
	flag = APPRENTICE
	department_flag = PEASANTS
	faction = "Station"
	total_positions = -1
	spawn_positions = -1

	allowed_races = list("Humen",
	"Half-Elf",
	"Dwarf",
	"Tiefling",
	"Dark Elf"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/roguetown/vagrant
	bypass_lastclass = TRUE
	bypass_jobban = TRUE

	tutorial = "The stench of your piss-laden clothes dont bug you anymore, the glances of disgust and loathing others give you is just a friendly greeting; the only reason you've not been killed already is because Volfs are known to be repelled by decaying flesh. You're going to be a solemn reminder what happens when something unwanted is born into this world."
	display_order = JDO_VAGRANT
	show_in_credits = FALSE
	can_random = FALSE

/datum/job/roguetown/vagrant/New()
	. = ..()
	peopleknowme = list()

/datum/outfit/job/roguetown/vagrant
	/// Chance to become a wise beggar, if we still have space for more wise beggars
	var/wise_chance = 10
	/// Amount of wise beggars spawned as of now
	var/wise_amount = 0
	/// Maximum amount of wise beggars that can be spawned
	var/wise_max = 3

/datum/outfit/job/roguetown/vagrant/pre_equip(mob/living/carbon/human/H)
	..()
	// wise beggar!!!
	// guaranteed full beggar gear + random stats
	if((wise_amount < wise_max) && prob(wise_chance))
		head = /obj/item/clothing/head/roguetown/wizhat/gen/wise //wise hat
		beltr = /obj/item/reagent_containers/powder/moondust
		beltl = /obj/item/clothing/mask/cigarette/rollie/cannabis
		cloak = /obj/item/clothing/cloak/raincloak/brown
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		r_hand = /obj/item/rogueweapon/mace/woodclub
		if(H.mind)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(2,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, rand(2,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(2,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE) //very good reading he is wise
			H.STASTR = rand(1, 20)
			H.STAINT = rand(5, 20)
			H.STALUC = rand(1, 20)
		H.change_stat("constitution", -rand(0, 3))
		H.change_stat("endurance", -rand(0, 3))
		H.real_name = "[H.real_name] the Wise"
		H.name = "[H.name] the Wise"
		wise_amount++
		return
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/knitcap
	if(prob(5))
		beltr = /obj/item/reagent_containers/powder/moondust
	if(prob(10))
		beltl = /obj/item/clothing/mask/cigarette/rollie/cannabis
	if(prob(10))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	if(prob(10))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
	else
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, rand(1,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, rand(1,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, rand(1,5), TRUE)
		H.STALUC = rand(1, 20)
	if(prob(5))
		r_hand = /obj/item/rogueweapon/mace/woodclub
	if(prob(5))
		l_hand = /obj/item/rogueweapon/mace/woodclub
	H.change_stat("strength", -1)
	H.change_stat("intelligence", -4)
	H.change_stat("constitution", -3)
	H.change_stat("endurance", -3)

/datum/outfit/job/roguetown/vagrant
	name = "Beggar"
