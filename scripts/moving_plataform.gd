extends AnimatableBody2D
@onready var target: Sprite2D = $target


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("acima da variavel tween")
	target.visible = false
	var tween = create_tween()

	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.tween_property(self,"global_position", target.global_position, 1)
	tween.tween_property(self, "global_position", global_position,1)
	tween.set_loops()
	print("abaixo do loop")
