extends Node2D

@export var player:CharacterBody2D
@onready var pipe_instance = preload("res://pipe/pipe.tscn")
@export var pipe_spawner:Timer 
@export var flow_left:Node2D
@export var flow_left_bg:Node2D
signal reset
var should_flow_left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("has_died",end)
	start()
	pass # Replace with function body.


func start():
	should_flow_left = true
	for i in flow_left.get_children():
		i.queue_free()
	for i in flow_left_bg.get_children():
		i.queue_free()
	player.reset()
	pipe_spawner.start()
	Music.set_bus("Master")
	emit_signal("reset")

func end():
	pipe_spawner.stop()
	should_flow_left = false
	await get_tree().create_timer(3).timeout
	start()

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _physics_process(delta):
	if should_flow_left:
		for i in flow_left.get_children():
			i.global_position.x -= 5   * 60 *delta
		for i in flow_left_bg.get_children():
			i.global_position.x -= 5   * 60 *delta

func create_pipe():
	var instance:Node2D = pipe_instance.instantiate()
	flow_left.add_child(instance)
	instance.global_position.x = $Marker2D.global_position.x

func _on_pipe_spawner_timeout():
	create_pipe()
	pass # Replace with function body.


func _on_pipe_collector_area_entered(area):
	if area.name == "Destroyer":
		(area.get_parent() as Node2D).queue_free()
	pass # Replace with function body.
