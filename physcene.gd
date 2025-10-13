extends Node3D
class_name Physcene
## A Node3D designed to hold an entire physics scene.

@export_category("Time") ## Variables related to time and its passing.
@export var time :float= 0 ## [i]t[/i] - the current relative scenic time.
@export var time_bound :Vector2= Vector2(0,0) ## The maximum and minimum values for [member time]. Doesn't state the [member time_bounds_used].
@export_flags("Lower","Upper") var time_bounds_used :int= 1 ## The [member time_bound]s being used.
@export var time_scale :float= 1 ## The scale at which [member time] changes. Pausing is separate of this.
@export var paused :bool= true ## If [member time] is to stay constant. Your [member time_scale] is saved elsewhere.
