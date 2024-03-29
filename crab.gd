extends CharacterBody2D
@export var parent: Node2D

const SPEED = 300.0

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
