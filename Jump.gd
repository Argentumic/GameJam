extends Node

@export var JUMP_VELOCITY_START: float = -125.0
@export var JUMP_VELOCITY_CONTINUOUS: float = -40.0
@export var gravity_coef: float = 1.0
@export var gravity_fall_coef: float = 2.0
@export var gravity_released_coef: float = 0.5

const COYOTE_TIMER_MAX: int = 6
var coyote_timer: int = 0

const VARIABLE_JUMP_TIMER_MAX: int = 5
var variable_jump_timer: int = 0

var can_jump: bool = false

func _physics_process(delta: float) -> void:
	
	if get_parent().velocity.y<0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef
	elif get_parent().velocity.y>=0 and !get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta * gravity_coef * gravity_fall_coef
	
	if get_parent().is_on_floor():
		coyote_timer = COYOTE_TIMER_MAX
		if !Input.is_action_pressed("Jump"):
			can_jump = true
		variable_jump_timer = VARIABLE_JUMP_TIMER_MAX
		
	if !get_parent().is_on_floor() and coyote_timer>0 and !Input.is_action_pressed("Jump"):
		can_jump = true
		coyote_timer -= 1
	elif !get_parent().is_on_floor() and coyote_timer==0:
		can_jump = false
	print(coyote_timer, " " ,can_jump, " " ,variable_jump_timer)
	
	if can_jump and Input.is_action_pressed("Jump") and variable_jump_timer>-1:
		if variable_jump_timer == VARIABLE_JUMP_TIMER_MAX:
			get_parent().velocity.y = JUMP_VELOCITY_START
			variable_jump_timer -= 1
		elif variable_jump_timer > 0 and variable_jump_timer < VARIABLE_JUMP_TIMER_MAX:
			get_parent().velocity.y += JUMP_VELOCITY_CONTINUOUS
			variable_jump_timer -= 1
		else:
			can_jump = false
			
	if Input.is_action_just_released("Jump"):
		can_jump = false
