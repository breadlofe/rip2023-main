extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($/root/Game/worldRoot/player.global_position.z <= -832):
		show()
		translate_object_local(Vector3(0,0,0.25*delta))
		
