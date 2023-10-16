extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(0,0,-5*delta))


func die():
	queue_free()


func _on_body_entered(hit_object):
	#print("hello")
	if hit_object.is_in_group("enemy"):
		#print("ouchie")
		hit_object.got_hit(self)
		self.queue_free()
