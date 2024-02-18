extends Control

@export var label:Label

@onready var score_up_sound = preload("res://pipe/score.tscn")

var score = 0
var score_up:bool  = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if score == -1:
		score = 0
	label.set_text("Score: "+ str(score))
	if score %10 == 0 and score > 0:
		if score_up == false:
			score_up = true
			play_score_up()
	else:
		score_up = false
		
	pass

func reset():
	score = -1

func update():
	score+= 1


func _on_hitbox_area_exited(area: Area2D) -> void:
	if area.name == "Destroyer":
		update()

func play_score_up():
	var instance = score_up_sound.instantiate()
	add_child(instance)
