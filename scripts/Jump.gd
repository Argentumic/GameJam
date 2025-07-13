extends Node

@export var JUMP_VELOCITY: float = -200.0
@export var gravity_coef: float = 1.0
@export var gravity_fall_coef: float = 2.0
@export var jump_cut_coef: float = 0.5

var is_ascending: bool = false
var is_cutted: bool = false

const COYOTE_TIMER_MAX: int = 6
var coyote_timer: int = 0

const BUFFER_TIMER_MAX: int = 15
var buffer_timer: int = 0

func _physics_process(delta: float) -> void:
	
	#GRAVITY STARTS
	if get_parent().velocity.y<0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef
		is_ascending = true
	elif get_parent().velocity.y>=0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef * gravity_fall_coef
		is_ascending = false
	if get_parent().velocity.y>=0 and !get_parent().is_on_floor() and $"../AnimationHandler/Solid".visible:
		$"../AnimationHandler/AnimationPlayer".play("Fall")
	if get_parent().is_on_floor() and $"../AnimationHandler/Solid".rotation > 0:
		$"../AnimationHandler/AnimationPlayer".play("Comeback")
	#GRAVITY ENDS
	#COYOTE TIME STARTS
	
	if get_parent().is_on_floor():
		coyote_timer = COYOTE_TIMER_MAX
	else:
		coyote_timer -= delta
	
	#COYOTE TIME ENDS
	#MAIN JUMP PART STARTS
	
	if (get_parent().is_on_floor() or coyote_timer > 0) and Input.is_action_just_pressed("Jump"):
		get_parent().velocity.y = JUMP_VELOCITY
		is_cutted = false
	
	if Input.is_action_just_released("Jump") and !get_parent().is_on_floor() and !is_cutted:
		get_parent().velocity.y *= jump_cut_coef
		is_cutted = true
			
	#MAIN JUMP PART ENDS
	#BUFFER TIME PART BELOW
		
	if Input.is_action_just_pressed("Jump") and !get_parent().is_on_floor():
		buffer_timer = BUFFER_TIMER_MAX
	
	if !get_parent().is_on_floor() and buffer_timer > 0:
		buffer_timer -= delta
	
	if get_parent().is_on_floor() and buffer_timer > 0:
		get_parent().velocity.y = JUMP_VELOCITY
		buffer_timer = 0
