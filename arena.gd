extends Node2D
@export var blueMid: Marker2D
@export var blueTop: Marker2D
@export var blueBot: Marker2D
@export var GreenMid: Marker2D
@export var GreenTop: Marker2D
@export var GreenBot: Marker2D

@export var MidCenter: Marker2D

@export var crabpack: PackedScene

var crab_scene = preload("res://crab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_spawn_pressed():
	var pos
	pos = get_node("Spawners/BlueTopSpawn").position
	spawn(pos)
	pos = get_node("Spawners/BlueMidSpawn").position
	spawn(pos)
	pos = get_node("Spawners/BlueBotSpawn").position
	spawn(pos)
	pos = get_node("Spawners/GreenTopSpawn").position
	spawn(pos)
	pos = get_node("Spawners/GreenMidSpawn").position
	spawn(pos)
	pos = get_node("Spawners/GreenBotSpawn").position
	spawn(pos)
	
func spawn(pos):
	var crab : CharacterBody2D
	crab = crabpack.instantiate()
	crab.position = pos
	add_child(crab)
	crab.set_movement_target(MidCenter.position)
	
	
