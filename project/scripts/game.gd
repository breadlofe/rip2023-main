extends Node

class_name GameManager

signal toggle_game_paused(is_paused: bool)

var bg_music := AudioStreamPlayer.new()

var game_paused: bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)
# Called when the node enters the scene tree for the first time.
func _ready():
	bg_music.stream = load("res://sfx/awake10_megaWall.ogg")
	bg_music.autoplay = true
	add_child(bg_music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent):
	if(event.is_action_pressed("menu")):
		game_paused = !game_paused
