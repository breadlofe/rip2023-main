extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#var the_player = get_tree().get_nodes_in_group("player")[0]
	#the_player.connect("body_entered", the_player.got_hit)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(0,0,10*delta))

func die():
	queue_free()


func _on_body_entered(hit_object):
	#print("hello")
	if hit_object.is_in_group("player"):
		hit_object.got_hit(self)
		self.queue_free()
