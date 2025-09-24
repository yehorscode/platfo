extends CanvasLayer

func _ready():
	visible = false
	EventController.connect("player_died", _on_player_died)
	$Control/Button.pressed.connect(_on_quit_pressed)

func _on_player_died():
	visible = true
	get_tree().paused = true

func _on_quit_pressed():
	get_tree().quit()
