extends CharacterBody2D

@export var healthLabel: Label
@onready var animation = get_node("AnimationPlayer")
@onready var characterCollision = get_node("CollisionShape2D")

@export var movement_speed: float = 5.0
@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")
@onready var progressBar: ProgressBar = get_node("ProgressBar")

var alive = true
var green = true
var chase = null
var isAttacking = null
var enemy
var direction
var canAttack
var health = 10

func _ready():
	healthLabel.text = "10"

func set_movement_target(movement_target: Vector2):
	navigation_agent.set_target_position(movement_target)

func death():
	alive = false
	get_node("AnimatedSprite2D").get_parent().visible = false
	get_node("SpotArea").monitoring = false
	get_node("HitArea").monitoring = false
	get_node("CollisionShape2D").disabled = true

func _physics_process(delta):
	if health <= 0:
		death()
	if alive:
		if isAttacking and enemy.alive:
			animation.play("Attack")
			attack()
		if !isAttacking:
			if chase == true:
				position += (enemy.position - position)/movement_speed
			else:
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
	healthLabel.text = str(value)

func damaged(amount):
	health = health - amount
	print(health)
	progressBar.value -= amount

func _on_spot_area_body_entered(body):
	if body.green != true:
		enemy = body
		chase = true
		print("enter")


func _on_spot_area_body_exited(body):
	if body.green != true:
		chase = false
		print("exit")


func _on_hit_area_body_entered(body):
	if body.green != true:
		chase = false
		velocity = Vector2.ZERO
		enemy = body
		print("targetlock")
		isAttacking = true


func _on_attack_cd_timeout():
	print("canAttack")
	canAttack = true

func attack():
	if isAttacking:
		if canAttack:
			enemy.damaged(3)
			$AttackCD.start(1)
			canAttack = false

