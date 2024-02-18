extends CharacterBody2D


@export var rotation_handle :Node2D
@export var flow_left_bg:Node2D
const gravity = 0.35   

@onready var dot = preload("res://player/dot.tscn")
@onready var flap_sfx = preload("res://player/flap_sound.tscn")
@onready var pipe_hit = preload("res://pipe/pipe_hit.tscn")



signal has_died
var is_dead:bool = false

var reset_position = Vector2(0,0)


func _ready():
	reset_position = global_position
	

func reset():
	print("Setting position")
	is_dead = false
	global_position = reset_position
	velocity.y = 0


func _physics_process(delta):
	
	
	if velocity.y < 10 :
		velocity.y += gravity
	

	
	if !is_dead:
		if Input.is_action_just_pressed("ui_accept"):
			flap()
		rotation_handle.rotation_degrees = move_toward(rotation_handle.rotation_degrees , velocity.y, delta *60)

	var collision = move_and_collide(velocity)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and !is_dead:
			flap()
func flap():
	create_dot()
	play_flap_sound()
	velocity.y = -7
#	move_and_slide()



func _on_hitbox_area_entered(body):
	if body.name != "player":
		if !is_dead:
			if body.name == "top" or body.name == "bottom" :
				play_hit_sound()
			Music.set_bus("sub")
			print("You are die")
			emit_signal("has_died")
			is_dead = true

	pass # Replace with function body.

func create_dot():
	if flow_left_bg == null:
		print("Background is not set")
		return
	var instance:Sprite2D = dot.instantiate()
	flow_left_bg.add_child(instance)
	instance.global_position = global_position
	
	
func play_flap_sound():
	var instance = flap_sfx.instantiate()
	add_child(instance)
	
	pass
		
func play_hit_sound():
	var instance = pipe_hit.instantiate()
	add_child(instance)
	
	pass
