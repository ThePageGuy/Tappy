extends CharacterBody2D


class_name Tappy


@onready var anim_sprite = $AnimSprite
@onready var anim_player = $AnimPlayer
@onready var engine_sound = $EngineSound

const GRAVITY = 300.0
const POWER = -200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()


func fly():
	if Input.is_action_just_pressed("Fly") == true:
		velocity.y = POWER
		anim_player.play("power")


func die():
	anim_sprite.stop()
	engine_sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
	
