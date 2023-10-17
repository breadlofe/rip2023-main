extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$/root/Game/worldRoot/main_hud.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	get_tree().paused = false
	$/root/Game/worldRoot/main_hud.show()
	hide()


func _on_quit_button_pressed():
	get_tree().quit()
