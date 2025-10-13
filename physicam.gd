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
@export_range(-360,360) var theta :float= 45 ## [i]θ[/i] - The angle along the horizon.
@export_range(-90,90) var phi :float= -30 ## [i]φ[/i] - The angle from the horizon upwards. To look at the top of an item, φ is negative.
@export var zero_point :Vector3= Vector3.ZERO ## The point that the Physicam orbits, and is centered at. By default, this is the origin of the [Physcene].
