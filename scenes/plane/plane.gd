extends CharacterBody2D

#move to signal manager
#signal on_plane_died #event handler for on_plane_died function in main

const GRAVITY: float = 1500.00
const POWER: float = -500

@onready var planeSprite: AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var plane_engine_sound = $PlaneEngineSound


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()  #when this is called , it will stop the physics process, so it will also cause fly() to stop

func die() -> void:
	plane_engine_sound.stop()
	planeSprite.stop()
	set_physics_process(false) #stop the physics process aafter the plane has hit the floor
	SignalManager.on_plane_died.emit() #emits (fire the function in main called on_plane_died - using a signal wired up with a signal manager)
	

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER  #the -400 is a value specified in the docs
		animation_player.play("power")
