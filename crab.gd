extends CharacterBody2D
@export var parent: Node2D
@export var healthLabel: Label

@export var movement_speed: float = 5.0
@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")

func _ready():
	healthLabel.text = "10"
	
func set_movement_target(movement_target: Vector2):
	navigation_agent.set_target_position(movement_target)

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	

func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()

func _on_progress_bar_value_changed(value):
	healthLabel.text = value
