extends CharacterBody3D

var elapsed: float = 0
var fire_timer: float = 0
var is_hit: bool = false
var max_health: int = 100
var health: int = 100

@export var bullet_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed = elapsed + delta
	translate_object_local(Vector3(0.25*sin(elapsed),0,0))
	fire_timer = fire_timer + delta
	$enemy_health.update(health,  max_health)
	#$enemy_health.update(health,  max_health)
	if(is_hit):
		health = health - 25
		#print(health)
		$enemy_health.update(health,  max_health)
		if health <= 0:
			queue_free()
		is_hit = false
		#self.queue_free()
	#print(fire_timer)
	if(fire_timer >= 2):
		#print("FIRE")
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
		fire_timer = 0
		
func got_hit(_the_pickup):
	is_hit = true
