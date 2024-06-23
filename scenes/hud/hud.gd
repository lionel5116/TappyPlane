extends Control

@onready var score_label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	#wire/connect this emmitter to the method below that draws text,
	#this is just a connection to an **event handler **
	#WIREUP ONLY FOR HE EMMITTER  - WILL EMIT() LATER ***
	SignalManager.on_score_updated.connect(on_score_updated) #WIRING UP A FUNCTON POINTER (HOF)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#score_label.text = str(ScoreManager.get_score())
	#handled by an emmiter so that we don't call every frame, we use an emmitter to handle **
	pass

func on_score_updated():
	score_label.text = str(ScoreManager.get_score())
