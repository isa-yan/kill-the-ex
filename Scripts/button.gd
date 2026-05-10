extends Button

func _ready():
	pressed.connect(on_press)

func on_press():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
