extends Sprite3D


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = $SubViewport.get_texture()
	
func update(_value, _max_value):
	$SubViewport/Healthbar2D.update_health(_value, _max_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
