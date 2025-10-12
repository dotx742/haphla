extends Node3D
class_name Object3D

@export_category("Kinematics")
@export var velocity :Vector3 ## Current change in the velocity of the object with respect to time.
@export var acceleration :Vector3 ## Current change in the position of the object with respect to time.
@export_category("Expressions")
@export var positionEquation :String ## A solvable expression defining the object's position.
@export var velocityEquation :String ## A solvable expression defining the object's position.
@export var accelerationEquation :String ## A solvable expression defining the object's position.
