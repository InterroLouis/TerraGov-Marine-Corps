/datum/element/plasma_on_attack
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2

	///the multiplier of plasma won via causing damage to living things.
	var/damage_plasma_multiplier = 1

/datum/element/plasma_on_attack/Attach(datum/target, damage_plasma_multiplier)
	. = ..()
	if(!isxeno(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_XENOMORPH_ATTACK_LIVING, .proc/damage_dealt)
	src.damage_plasma_multiplier = damage_plasma_multiplier

///Gives plasma when damage is caused on living mob.
/datum/element/plasma_on_attack/proc/damage_dealt(datum/source, mob/living/attacked, damage)
	SIGNAL_HANDLER
	var/mob/living/carbon/xenomorph/furious = source
	furious.gain_plasma(damage * damage_plasma_multiplier)

