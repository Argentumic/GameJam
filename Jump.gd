extends Node

@export var JUMP_VELOCITY: float = -200.0
@export var gravity_coef: float = 1.0
@export var gravity_fall_coef: float = 2.0
@export var jump_cut_coef: float = 0.5

const COYOTE_TIMER_MAX: int = 6
var coyote_timer: int = 0

const BUFFER_TIMER_MAX: int = 6
var buffer_timer: int = 0

var can_jump: bool = false

func _physics_process(delta: float) -> void:
	
	#GRAVITY STARTS
	if get_parent().velocity.y<0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef
	elif get_parent().velocity.y>=0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef * gravity_fall_coef
	#GRAVITY ENDS
	#COYOTE TIME STARTS
	
	if get_parent().is_on_floor():
		coyote_timer = COYOTE_TIMER_MAX
		if !Input.is_action_pressed("Jump"):
			can_jump = true
		
	if !get_parent().is_on_floor() and coyote_timer>0 and !Input.is_action_pressed("Jump"):
		can_jump = true
		coyote_timer -= delta
	elif !get_parent().is_on_floor() and coyote_timer==0:
		can_jump = false
	
	#COYOTE TIME ENDS
	#MAIN JUMP PART STARTS
	
	if can_jump and Input.is_action_just_pressed("Jump"):
		get_parent().velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("Jump") and !get_parent().is_on_floor():
		get_parent().velocity.y *= jump_cut_coef
			
	if Input.is_action_just_released("Jump"):
		can_jump = false
	#MAIN JUMP PART ENDS
	#BUFFER TIME PART BELOW
		
	if Input.is_action_just_pressed("Jump") and !get_parent().is_on_floor():
		buffer_timer = BUFFER_TIMER_MAX
	
	if !get_parent().is_on_floor() and buffer_timer > 0:
		buffer_timer -= delta
	
	if get_parent().is_on_floor() and buffer_timer > 0:
		get_parent().velocity.y = JUMP_VELOCITY
		can_jump = true
		buffer_timer = 0
