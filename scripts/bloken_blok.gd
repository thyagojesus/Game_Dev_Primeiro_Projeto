extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	var bobies = area_2d.get_overlapping_bodies()
	for body in bobies:
		var player: CharacterBody2D = body
		if player.is_on_floor():
			anim.play("broken")
