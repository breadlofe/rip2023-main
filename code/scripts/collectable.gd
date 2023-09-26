extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var the_player = get_tree().get_nodes_in_group("player")[0]
	connect("body_entered", the_player.get_pickup)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(hit_object):
	print("hello")
	if hit_object.is_in_group("player"):
		hit_object.get_pickup(self)
		self.queue_free()
