extends Camera2D
var inputx
var inputy
@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	inputx = (int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")))
	inputy = (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
	position.x = inputx * speed
	position.y = inputy * speed
