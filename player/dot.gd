extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween:Tween = create_tween()
	var decay_time:float = 1.3
	tween.tween_property(self,"modulate:a",0.0,decay_time)
	await get_tree().create_timer(decay_time).timeout;
	queue_free()
