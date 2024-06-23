extends Node2D

#const SCROLL_SPEED: float = 120.0
@onready var score_sound = $ScoreSound


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta # scroll to the left on x axis


func _on_screen_exited():
	print("_on_screen_exited")
	queue_free() #delete all node instances


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		#print("_on_pipe_body_entered",body)
		#if body.has_method("die") == true:
		body.die()


func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		score_sound.play()
		ScoreManager.increment_score() #if successfully passed laser, add one to score, call emmiter *
		#print("_on_laser_body_exited",body)
