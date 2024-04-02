extends Node2D
@export var blueMid: Marker2D
@export var blueTop: Marker2D
@export var blueBot: Marker2D
@export var GreenMid: Marker2D
@export var GreenTop: Marker2D
@export var GreenBot: Marker2D

@export var MidCenter: Marker2D

@export var crabpack: PackedScene
@export var goatpack: PackedScene

var crab_scene = preload("res://crab.tscn")
var goat_scene = preload("res://goat.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_spawn_pressed():
	var pos
	#pos = get_node("Spawners/BlueTopSpawn").position
	#spawnCrab(pos)
	#pos = get_node("Spawners/BlueMidSpawn").position
	#spawnCrab(pos)
	pos = get_node("Spawners/BlueBotSpawn").position
	spawnCrab(pos)
	#pos = get_node("Spawners/GreenTopSpawn").position
	#spawnGoat(pos)
	#pos = get_node("Spawners/GreenMidSpawn").position
	#spawnGoat(pos)
	pos = get_node("Spawners/GreenBotSpawn").position
	spawnGoat(pos)
	
func spawnCrab(pos):
	var crab : CharacterBody2D
	crab = crabpack.instantiate()
	crab.position = pos
	add_child(crab)
	crab.set_movement_target(MidCenter.position)
	
func spawnGoat(pos):
	var goat : CharacterBody2D
	goat = goatpack.instantiate()
	goat.position = pos
	add_child(goat)
	goat.set_movement_target(MidCenter.position)
