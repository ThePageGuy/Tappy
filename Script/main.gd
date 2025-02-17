extends Control

@onready var high_score_label = $MarginContainer/HighScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	high_score_label.text = str(ScoreManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Fly") == true:
		GameManager.load_game_scene()
