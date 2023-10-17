extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate_object_local(Vector3(0,0,2*delta))
	#print(global_position.z)
	#365 level change for z value
	if(global_position.z >= 365):
		$/root/Game/worldRoot/player.global_position.z = -833
		$/root/Game/worldRoot/Camera3D.global_position.z = -833 + 19
