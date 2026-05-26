extends CharacterBody2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Area2D = $Hitbox
@onready var wall_detector: RayCast2D = $WallDetector
@onready var ground_detector: RayCast2D = $GroundDetector
@onready var player_detector: RayCast2D = $PlayerDetector
@onready var bone_start_position_2: Node2D = $BoneStartPosition2

const SPINNING_BONE = preload("uid://c3bwc4lkfcq8m")

enum SkeletonState {
	walk,attack,hurt
}
var direction = 1
var can_throw = true

const SPEED = 30.0
const JUMP_VELOCITY = -400.0

var status = SkeletonState

func _ready() -> void:
	go_to_walk_state()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	match status:
		SkeletonState.walk:
			walk_state(delta)
		SkeletonState.attack:
			attack_state(delta)
		SkeletonState.hurt:
			hurt_state(delta)

	move_and_slide()

func go_to_walk_state():
	status = SkeletonState.walk
	anim.play("walk")
	
func go_to_attack_state():
	status = SkeletonState.attack
	anim.play("attack")
	velocity = Vector2.ZERO
	can_throw= true
	
	
	

func go_to_hurt_state():
	status = SkeletonState.hurt
	anim.play("hurt")
	hitbox.process_mode =Node.PROCESS_MODE_DISABLED
	velocity = Vector2.ZERO
	
	
func walk_state(_delta):
	velocity.x = SPEED * direction
	if wall_detector.is_colliding():
		scale.x *= -1
		direction *= -1
		
	if not ground_detector.is_colliding():
		scale.x *= -1
		direction *= -1
		
	if player_detector.is_colliding():
		go_to_attack_state()
		return
		
func attack_state(delta):
	if anim.frame ==2 && can_throw: 
		throw_bone()
		can_throw = false
	
func hurt_state(_delta):
	pass
func throw_bone():
	var new_bone = SPINNING_BONE.instantiate()
	add_sibling(new_bone)
	new_bone.position = bone_start_position_2.global_position
	new_bone.set_direction(self.direction)
	
func take_damege():
	go_to_hurt_state()
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "attack":
		go_to_walk_state()
		return
