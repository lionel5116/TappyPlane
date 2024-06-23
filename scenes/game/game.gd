extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died) #dynamically create signal - using signal manager as opposed to using Signals in UI
	ScoreManager.set_score(0)
	#randomize()
	spawn_pipes()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(spawn_upper.position.y,spawn_lower.position.y)
	#- notice how we use the Vector2D (as explained in ChatGPT in our notes)
	new_pipes.position = Vector2(spawn_upper.position.x,y_pos) #set the position at 550,450 on the x and y 
	pipes_holder.add_child(new_pipes) #add the instantiated pipes to the scene with add child

func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died():
	#print("_on_plane_died") # Replace with function body.
	stop_pipes()
