extends Control
@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() #toggles visibility on and off on the property of this scene
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if visible means : if the space label = true
	if space_label.visible == true and  \
				   Input.is_action_just_pressed("fly") == true:
		GameManager.load_main_scene()
		

func toggleShowHideGameOverAndShowSpaceLabel() -> void :
	game_over_label.hide()
	space_label.show()

func on_plane_died() -> void:
	game_over_sound.play()
	show() #toggles visibility on and off on the property of this scene
	timer.start()

func _on_timer_timeout():
	toggleShowHideGameOverAndShowSpaceLabel()
