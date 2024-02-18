extends Node2D

var should_stop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		i.add_to_group("die_group")
	position.y += randi_range(-150,150)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func stop():
	should_stop = true
