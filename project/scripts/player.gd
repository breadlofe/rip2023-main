extends CharacterBody3D

signal change_score(new_score)

@export var speed: float = 5.0
@export var bullet_scene: PackedScene

var time_to_move_in_dir: float = 0.5

var time_survived: float = 0.0 	#Constantly add delta time to this
								#When we pass a whole new number, notify UI to change.
var time_score: int = 0			#The whole number that is currently displayed in the UI

var score: int = 0

var sound_player := AudioStreamPlayer.new()

var health_percent: float = 1.0	#1.0 is 100% health 

var is_hit: bool = false
@export var tick_max: float = 0.5
var tick_cur: float = 0.0

@onready var main_hud = get_node("/root/Game/worldRoot/main_hud")

# Called when the node enters the scene tree for the first time.
func _ready():
	#var mh = get_node("/root/worldRoot/main_hud")
	#print(mh)
	connect("change_score",main_hud.do_change_score)
	var tnode: Timer
	$redman.hide()
	add_child(sound_player)
	
func _process(delta):
	do_movement(delta)
	
	# HEALTH BAR LOWERS
	if is_hit:
		$redman.show()
		tick_cur += delta
		health_percent = max(0.0, health_percent - 0.2 * delta)
	if tick_cur >= tick_max:
		is_hit = false
		$redman.hide()
		tick_cur = 0
	main_hud.do_change_health(health_percent)
	
	# SCORE TRACKER
	time_survived += delta
	if(int(time_survived) > time_score):
		time_score = int(time_survived)
	#	emit_signal("change_score", time_score)
		#print(time_score)
		
	# FIRE BULLETS
	if Input.is_action_just_pressed("fire"):
		var sound_effect = load("res://sfx/player_fire.ogg")
		sound_player.stream = sound_effect
		sound_player.play()
		var new_bullet = bullet_scene.instantiate()
		var new_bullet2 = bullet_scene.instantiate()
		#puts laser where the container is.
		get_node("../bullet_container").add_child(new_bullet)
		get_node("../bullet_container").add_child(new_bullet2)
		# global position makes it so that the position of the laser begins at position of container.
		new_bullet.global_position = global_position + Vector3(4,0,-2)
		new_bullet.global_rotation = global_rotation
		new_bullet2.global_position = global_position + Vector3(-4,0,-2)
		new_bullet2.global_rotation = global_rotation

func _physics_process(_delta):
	pass

func do_movement(delta):
	if global_position.x > -20 && global_position.x <= 20:
		var input_vec = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		var move_vec = Vector3(input_vec.x, 0, input_vec.y).normalized() * speed
		velocity = move_vec
		move_and_slide()
	if global_position.x <= -20:
		global_position.x = -19.9
	if global_position.x >= 20:
		global_position.x = 19.9

func on_change_direction():
	print("change directions!")
	
func get_pickup(_the_pickup):
	var sound_effect = load("res://sfx/got_collectable.ogg")
	sound_player.stream = sound_effect
	sound_player.play()
	score = score + 1
	emit_signal("change_score", score)
	
func got_hit(_the_pickup):
	is_hit = true
