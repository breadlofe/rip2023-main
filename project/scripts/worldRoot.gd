extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func play():
	print("hi")
	get_tree().paused = false
