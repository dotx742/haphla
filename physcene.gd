extends Node3D
class_name Physcene
## A Node3D designed to hold an entire physics scene.

@export_category("Time") ## Variables related to time and its passing.
@export var time :float= 0 ## [i]t[/i] - the current relative scenic time.
@export var time_bound :Vector2= Vector2(0,0) ## The minimum (x) and maximum (y) values for [member time]. Doesn't state the [member time_bounds_used].
@export_enum("None:0", "Lower:1","Upper:2", "Both:3") var time_bounds_used :int= 1 ## The [member time_bound]s being used.
@export var time_scale :float= 1 ## The scale at which [member time] changes. Pausing is separate of this.
@export var paused :bool= false ## If [member time] is to stay constant. Your [member time_scale] is saved elsewhere.

signal time_changed(del: float)

func _process(delta: float) -> void:
	if time_bounds_used % 4 == 3 and time_bound.x == time_bound.y:
		time_scale = 0
	if (time_bounds_used % 2 > 0.5) and (time < time_bound.x):
		time = time_bound.x
		time_scale *= -1
	elif (time_bounds_used % 4 > 1) and (time > time_bound.y):
		time = time_bound.y
		time_scale *= -1
	elif not paused: time += delta*time_scale
	if time_scale != 0: emit_signal("time_changed", snappedf(time,0.01))
