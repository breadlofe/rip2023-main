extends CharacterBody3D

signal change_score(new_score)

@export var speed: float = 5.0
@export var bounce_time: float = 1.0
@export var bullet_scene: PackedScene

var moving_up: bool = false
var time_to_move_in_dir: float = 0.5

var time_survived: float = 0.0 	#Constantly add delta time to this
								#When we pass a whole new number, notify UI to change.
var time_score: int = 0			#The whole number that is currently displayed in the UI

var health_percent: float = 1.0	#1.0 is 100% health 

@onready var main_hud = get_node("/root/worldRoot/main_hud")

# Called when the node enters the scene tree for the first time.
func _ready():
	#var mh = get_node("/root/worldRoot/main_hud")
	#print(mh)
	connect("change_score",main_hud.do_change_score)
	
	var tnode: Timer
	tnode = $simpleCube/Node/Timer
	tnode.wait_time = bounce_time
	$simpleCube/Node/Timer.start()
	#$Timer.start() # resets timer so they go at different speeds at first loop.
	
	#1st way -->
	#tnode = find_child("b*")
	#get_child does not have to seach, so it is faster.
	
	#2nd way -->
	#tnode = get_child("Node/bounce_time")
	#find_node: gets a node by name
	
	#3rd way -->
	#tnode = get_node("/root/world_root/bert/Node/bounce_time")
	
	#4th way -->
	#tnode = $Node/bounce_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	do_movement(delta)
	
	#Temporary example
	health_percent = max(0.0, health_percent - 0.2 * delta)
	main_hud.do_change_health(health_percent)
	
	time_survived += delta
	if(int(time_survived) > time_score):
		time_score = int(time_survived)
		emit_signal("change_score", time_score)
		print(time_score)
	if Input.is_action_just_pressed("fire"):
		var new_bullet = bullet_scene.instantiate()
		#puts laser where the container is.
		get_node("../bullet_container").add_child(new_bullet)
		# global position makes it so that the position of the laser begins at position of container.
		new_bullet.global_position = global_position
		new_bullet.global_rotation = global_rotation

func _physics_process(_delta):
	pass

func do_movement(delta):
	# A Vector2 (move_vec.x is in range (-1.0, 1.0)
	var input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var up_move: float = 2.0
	if not moving_up:
		up_move *= -1 
	var move_vec = Vector3(input_vec.x, 0, input_vec.y).normalized() * speed #* delta
	
	move_vec.y = up_move * delta
	#translate_object_local(move_vec)
	velocity = move_vec
	move_and_slide()

func on_change_direction():
	moving_up = not moving_up
	print("change directions!")
	
func get_pickup(_the_pickup):
	print("you got a pickup")
	#the_pickup.queue_free()
