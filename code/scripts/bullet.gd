extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(-2*delta,0,0))

func die():
	print("killed")
	queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group("player"):
		print("YOU SHOT A MAN")
		self.queue_free()
