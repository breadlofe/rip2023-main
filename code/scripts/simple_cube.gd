extends MeshInstance3D

@export var speed: float = 5.0
var moving_up: bool = false
var time_to_move_in_dir: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# A Vector2 (move_vec.x is in range (-1.0, 1.0)
	var input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var move_vec = Vector3(input_vec.x, 0, input_vec.y).normalized() * speed * delta
	translate_object_local(move_vec)

func _physics_process(delta):
	pass
