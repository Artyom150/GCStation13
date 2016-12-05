
var/const/ENGSEC			=(1<<0)

var/const/CAPTAIN			=(1<<0)
var/const/HOS				=(1<<1)
var/const/WARDEN			=(1<<2)
var/const/DETECTIVE			=(1<<3)
var/const/OFFICER			=(1<<4)
var/const/CHIEF				=(1<<5)
var/const/ENGINEER			=(1<<6)
var/const/ATMOSTECH			=(1<<7)
var/const/AI				=(1<<8)
var/const/CYBORG			=(1<<9)
var/const/CENTCOM			=(1<<10)

var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/SCIENTIST			=(1<<1)
var/const/CHEMIST			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
var/const/PSYCHIATRIST		=(1<<7)
var/const/ROBOTICIST		=(1<<8)
var/const/PARAMEDIC			=(1<<9)


var/const/SUPPORT			=(1<<2)

var/const/HOP				=(1<<0)
var/const/BARTENDER			=(1<<1)
var/const/BOTANIST			=(1<<2)
var/const/CHEF				=(1<<3)
var/const/JANITOR			=(1<<4)
var/const/LIBRARIAN			=(1<<5)
var/const/QUARTERMASTER		=(1<<6)
var/const/CARGOTECH			=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER			=(1<<9)
var/const/CHAPLAIN			=(1<<10)
var/const/CLOWN				=(1<<11)
var/const/MIME				=(1<<12)
var/const/CIVILIAN			=(1<<13)


var/const/KARMA				=(1<<3)

var/const/NANO				=(1<<0)
var/const/BLUESHIELD		=(1<<1)
var/const/BARBER			=(1<<3)
var/const/MECHANIC			=(1<<4)
var/const/BRIGDOC			=(1<<5)
var/const/JUDGE				=(1<<6)
var/const/PILOT				=(1<<7)

var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Captain",
	"Chief of Staff",
)


var/list/engineering_positions = list(
	"Chief Engineering Specialist",
	"Engineering Specialist",
	"Life Support Specialist",
	"Pod Specialist"
)


var/list/medical_positions = list(
	"Chief Medical Specialist",
	"Medical Specialist",
	"Shipboard Psychiatrist",
	"Chemical Specialist",
	"Medical Specialist, Viral",
	"Field Medic"
)


var/list/science_positions = list(
	"Chief Navy Researcher",
	"Navy Researcher",
	"Gene Therapist",	//Part of both medical and science
	"Robotics Specialist",
)

//BS12 EDIT
var/list/support_positions = list(
	"Navy Judicial Officer",
	"Internal Affairs Investigator",
	"Bartender",
	"Cook",
	"Botanist",
	"Shipboard Barber",
	"Navy Sanitation Specialist",
	"Navy Archivist",
	"Navy Chaplain",
	"Navy Liaison",
	"Navy Bodyguard",
	"Clown",
	"Mime",
)

var/list/supply_positions = list(
	"Ship Quartermaster",
	"Logistics Specialist",
	"Logistics, Asteroid Miner"
)

var/list/service_positions = support_positions - supply_positions


var/list/security_positions = list(
	"Imperial Marine Officer, 1st Lt.",
	"Imperial Detention Officer, 1st Sgt.",
	"Navy Investigator",
	"Imperial Marine, PFC",
	"Medical Specialist, Brig",
	"Marine Pilot, Security"
)


var/list/civilian_positions = list(
	"Navy Recruit"
)

var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"Drone",
	"pAI"
)

var/list/whitelisted_positions = list(
	"Navy Bodyguard",
	"Navy Liaison",
	"Shipboard Barber",
	"Pod Specialist",
	"Medical Specialist, Brig",
	"Navy Judicial Officer",
	"Marine Pilot, Security",
)


/proc/guest_jobbans(var/job)
	return (job in whitelisted_positions)

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)	continue
		if(J.title == job)
			titles = J.alt_titles

	return titles

