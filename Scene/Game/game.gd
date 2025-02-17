extends Node2D

const PIPES = preload("res://Scene/Game/pipes.tscn")


@onready var spawn_up = $SpawnUp
@onready var spawn_down = $SpawnDown
@onready var spawn_timer = $SpawnTimer
@onready var pipes_holder = $PipesHolder


# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes():
	var new_pipes: Pipes = PIPES.instantiate()
	var yp: float = randf_range(spawn_down.position.y, spawn_up.position.y)
	new_pipes.position = Vector2(spawn_down.position.x, yp)
	pipes_holder.add_child(new_pipes)


func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died():
	spawn_timer.stop()
