extends CanvasLayer

var hp_gradient: GradientTexture1D = preload("res://images/hp_gradient.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func do_change_score(new_value):
	$score_label.text = "Score: " + str(new_value)

func do_change_health(new_health_percent):
	var bar = $hp_bar
	bar.value = new_health_percent * bar.max_value
	bar.tint_progress = hp_gradient.gradient.sample(new_health_percent)
