/datum/job/cmo
	title = "Chief Medical Specialist"
	flag = CMO
	department_flag = MEDSCI
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffddf0"
	idtype = /obj/item/weapon/card/id/cmo
	req_admin_notify = 1
	access = list(access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_paramedic, access_mineral_storeroom)
	minimal_access = list(access_eva, access_medical, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_maint_tunnels, access_paramedic, access_mineral_storeroom)
	minimal_player_age = 21

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/heads/cms(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_or_collect(new /obj/item/clothing/under/rank/chief_medical_officer(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		H.equip_or_collect(new /obj/item/device/pda/heads/cmo(H), slot_wear_pda)
		H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/cmo(H), slot_wear_suit)
		H.equip_or_collect(new /obj/item/weapon/storage/firstaid/adv(H), slot_l_hand)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		H.equip_or_collect(new /obj/item/weapon/melee/classic_baton/telescopic(H), slot_in_backpack)
		return 1



/datum/job/doctor
	title = "Medical Specialist"
	flag = DOCTOR
	department_flag = MEDSCI
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Chief Medical Specialist"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_morgue, access_surgery, access_maint_tunnels)
	alt_titles = list("Medical Specialist, Coroner", "Medical Specialist, Surgeon")
	minimal_player_age = 3

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic(H), slot_back)
			if(3) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
			if(4) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(H.mind.role_alt_title)
			switch(H.mind.role_alt_title)
				if("Medical Specialist, Coroner")
					H.equip_or_collect(new /obj/item/clothing/under/rank/medical/mortician(H), slot_w_uniform)
					H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/mortician(H), slot_wear_suit)
					if(H.backbag != 1)
						H.equip_or_collect(new /obj/item/clothing/head/surgery/black(H), slot_in_backpack)
						H.equip_or_collect(new /obj/item/weapon/autopsy_scanner(H), slot_in_backpack)
						H.equip_or_collect(new /obj/item/device/mass_spectrometer(H), slot_in_backpack)
						H.equip_or_collect(new /obj/item/weapon/storage/box/bodybags(H), slot_in_backpack)
				if("Medical Specialist, Surgeon")
					H.equip_or_collect(new /obj/item/clothing/under/rank/medical/blue(H), slot_w_uniform)
					H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
					H.equip_or_collect(new /obj/item/clothing/head/surgery/blue(H), slot_head)
				if("Medical Specialist")
					H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
					H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
		else
			H.equip_or_collect(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
			H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
		H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_or_collect(new /obj/item/device/pda/medical(H), slot_wear_pda)
		H.equip_or_collect(new /obj/item/weapon/storage/firstaid/adv(H), slot_l_hand)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		return 1



//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro
/datum/job/chemist
	title = "Chemical Specialist"
	flag = CHEMIST
	department_flag = MEDSCI
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Specialist"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_mineral_storeroom)
	minimal_access = list(access_medical, access_chemistry, access_maint_tunnels, access_mineral_storeroom)
	minimal_player_age = 7


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/chemistry(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_chem(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		H.equip_or_collect(new /obj/item/clothing/glasses/science(H), slot_glasses)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chemist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/chemist(H), slot_wear_pda)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/chemist(H), slot_wear_suit)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		return 1



/datum/job/geneticist
	title = "Gene Therapist"
	flag = GENETICIST
	department_flag = MEDSCI
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Specialist and the Chief Navy Researcher"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_research, access_mineral_storeroom)
	minimal_access = list(access_medical, access_morgue, access_genetics, access_research, access_maint_tunnels)
	minimal_player_age = 3

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/genetics(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_gen(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_medsci(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/geneticist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/geneticist(H), slot_wear_pda)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/genetics(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		return 1

/datum/job/virologist
	title = "Medical Specialist, Viral"
	flag = VIROLOGIST
	department_flag = MEDSCI
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Specialist"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics)
	minimal_access = list(access_medical, access_virology, access_maint_tunnels, access_mineral_storeroom)
	minimal_player_age = 7

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_or_collect(new /obj/item/weapon/storage/backpack/virology(H), slot_back)
			if(3) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_vir(H), slot_back)
			if(4) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_or_collect(new /obj/item/clothing/under/rank/virologist(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/device/pda/viro(H), slot_wear_pda)
		H.equip_or_collect(new /obj/item/clothing/mask/surgical(H), slot_wear_mask)
		H.equip_or_collect(new /obj/item/clothing/shoes/white(H), slot_shoes)
		H.equip_or_collect(new /obj/item/clothing/suit/storage/labcoat/virologist(H), slot_wear_suit)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		return 1

/datum/job/psychiatrist
	title = "Shipboard Psychiatrist"
	flag = PSYCHIATRIST
	department_flag = MEDSCI
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Medical Specialist"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology, access_genetics, access_psychiatrist)
	minimal_access = list(access_medical, access_psychiatrist, access_maint_tunnels)

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(H.mind.role_alt_title)
			switch(H.mind.role_alt_title)
				if("Shipboard Psychiatrist")
					H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/psych(H), slot_w_uniform)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/medical(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/device/pda/medical(H), slot_wear_pda)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/survival(H), slot_in_backpack)
		return 1

/datum/job/paramedic
	title = "Field Medic"
	flag = PARAMEDIC
	department_flag = MEDSCI
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Specialist"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/medical
	access = list(access_paramedic, access_medical, access_sec_doors, access_maint_tunnels, access_external_airlocks, access_morgue)
	minimal_access=list(access_paramedic, access_medical, access_sec_doors, access_maint_tunnels, access_external_airlocks, access_morgue)
	minimal_player_age = 3


	equip(var/mob/living/carbon/human/H)
		if(!H)  return 0
		H.equip_or_collect(new /obj/item/device/radio/headset/headset_med(H), slot_l_ear)
		if(H.backbag == 2) H.equip_or_collect(new /obj/item/weapon/storage/backpack/medic (H), slot_back)
		if(H.backbag == 3) H.equip_or_collect(new /obj/item/weapon/storage/backpack/satchel_med(H), slot_back)
		H.equip_or_collect(new /obj/item/clothing/under/rank/medical/paramedic(H), slot_w_uniform)
		H.equip_or_collect(new /obj/item/clothing/shoes/black(H), slot_shoes)
		H.equip_or_collect(new /obj/item/device/pda/medical(H), slot_wear_pda)
		H.equip_or_collect(new /obj/item/clothing/mask/cigarette(H), slot_wear_mask)
		H.equip_or_collect(new /obj/item/clothing/head/soft/blue(H), slot_head)
		H.equip_or_collect(new /obj/item/device/flashlight/pen(H), slot_s_store)
		H.equip_or_collect(new /obj/item/weapon/storage/box/engineer(H), slot_in_backpack)
		H.equip_or_collect(new /obj/item/device/healthanalyzer(H), slot_in_backpack)
		return 1
