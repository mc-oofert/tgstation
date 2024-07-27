/obj/item/pod_equipment
	icon = 'icons/testing/greyscale_error.dmi'
	w_class = WEIGHT_CLASS_HUGE
	/// the pod we are attached to
	var/obj/vehicle/sealed/space_pod/pod
	/// the slot we go in
	var/slot
	/// multiplier for power usage by moving
	var/movement_power_usage_mult = 1
	/// list of paths we are not allowed to be inserted with, converted to typecache
	var/list/exclusive_with
	/// do we allow us of the same type to be inserted multiple times
	var/allow_dupes = FALSE
	/// interface ID used for our interface, see our tgui folder
	var/interface_id

/obj/item/pod_equipment/Initialize(mapload)
	. = ..()
	if(islist(exclusive_with)) // this couldve been done better, somehow, but no clue how
		exclusive_with = typecacheof(exclusive_with)
		if(allow_dupes)
			exclusive_with -= type

/obj/item/pod_equipment/examine(mob/user)
	. = ..()
	. += span_notice("This goes into the [slot].")

/obj/item/pod_equipment/Destroy(force)
	. = ..()
	on_detach()
	pod = null

/// Optional, return an actual overlay or an icon state name to show when attached.
/obj/item/pod_equipment/proc/get_overlay()

/obj/item/pod_equipment/proc/on_attach(mob/user)

/obj/item/pod_equipment/proc/on_detach(mob/user)

/obj/item/pod_equipment/proc/create_occupant_actions(mob/occupant, flag = NONE)

/// generic equipment action, for the really simple actions
/datum/action/vehicle/sealed/spacepod_equipment
	background_icon_state = "bg_tech"
	overlay_icon_state = "bg_tech_border"
	var/datum/callback/callback_on_click

/datum/action/vehicle/sealed/spacepod_equipment/Trigger(trigger_flags)
	. = ..()
	callback_on_click.Invoke(owner)
