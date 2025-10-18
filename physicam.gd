extends Camera3D
class_name Physicam
## A [Camera3D] specifically coded for use with a [Physcene].
##
## A Physicam is not too different from a regular [Camera3D].
## It has simply been scripted and assigned a class for convenience when working with a [Physcene].
## [br][br]One of these conveniences is in redefining position and orientation to work in tandem.
##Rather than direct use of the [Node3D.position] and [member Node3D.rotation] values,
## a Physicam uses a zero point and a spherical vector.
## The [member zero_point] is what the camera orbits around, and is always centered in view.
## The spherical vector defined how far ([member rho]) the camera is from there,
## and at what horizontal ([member theta]) and vertical ([member phi]) angles.

@export_range(0.05,2048) var rho :float= 5 ## [i]ρ[/i] - The distance from the point the camera is centered at.
@export_range(-360,360) var theta :float= 30 ## [i]θ[/i] - The angle along the horizon. Also the Euler Y-angle.
@export_range(-90,90) var phi :float= 30 ## [i]φ[/i] - The angle from the horizon upwards. To look at the top of an item, φ is negative. Also the Euler X-angle.
@export var zero_point :Vector3= Vector3.ZERO ## The point that the Physicam orbits, and is centered at. By default, this is the origin of the [Physcene].
@export var rotation_speed :Vector2= Vector2(30,30)

var rotation_save :Vector2= Vector2(30, 30)

func check_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("octant_ppp"):
		theta = 30
		phi = 30
	if Input.is_action_just_pressed("octant_npp"):
		theta = 120
		phi = 30
	if Input.is_action_just_pressed("octant_nnp"):
		theta = -150
		phi = 30
	if Input.is_action_just_pressed("octant_pnp"):
		theta = -60
		phi = 30
	if Input.is_action_just_pressed("octant_ppn"):
		theta = 30
		phi = -30
	if Input.is_action_just_pressed("octant_npn"):
		theta = 120
		phi = -30
	if Input.is_action_just_pressed("octant_nnn"):
		theta = -150
		phi = -30
	if Input.is_action_just_pressed("octant_pnn"):
		theta = -60
		phi = -30
	if Input.is_action_just_pressed("zoom_in"):
		rho *= 9./10.
	if Input.is_action_just_pressed("zoom_out"):
		rho *= 10./9.
	if Input.is_action_just_pressed("octant_save"):
		rotation_save = Vector2(theta, phi)
	if Input.is_action_just_pressed("octant_load"):
		theta = rotation_save.x
		phi = rotation_save.y
	
func _process(delta: float) -> void:
		theta += delta*rotation_speed.x*Input.get_axis("rot_left", "rot_right")
		if theta > 180: theta-= 360
		if theta < -180: theta += 360
		phi += delta*rotation_speed.y*Input.get_axis("rot_down", "rot_up")
		phi = clamp(phi, -90, 90)
		update(delta)

func update(dt: float) -> void:
	var Theta :float= deg_to_rad(theta)
	var Phi :float= deg_to_rad(phi)
	rotation = Vector3(lerp(rotation.x, -Phi, 1-0.25**dt), lerp_angle(rotation.y, Theta, 1-0.25**dt), 0)
	position = rho*Vector3(cos(-rotation.x)*sin(rotation.y), sin(-rotation.x), cos(-rotation.x)*cos(rotation.y))
