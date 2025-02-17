extends Node2D


class_name Pipes

const OFF_SCREEN = -500.0
const SPEED = GameManager.SCROLL_SPEED
@onready var score_sound = $ScoreSound
@onready var von = $VisibleOnScreenNotifier2D


func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * SPEED
	check_off_screen();

func check_off_screen():
	if von.global_position.x < get_viewport_rect().position.x:
		queue_free();
	
func on_plane_died():
	set_process(false)

func _on_screen_exited():
	queue_free();


func _on_pipe_body_entered(body):
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body):
	if body is Tappy:
		score_sound.play()
		ScoreManager.increment_score()
