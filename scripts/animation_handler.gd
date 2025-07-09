extends Node

@onready var solid_anim = $Solid
@onready var liquid_anim = $Liquid
@onready var gas_anim = $Gas

func _process(delta: float) -> void:
	if get_parent().velocity.x > 0 and get_parent().is_on_floor():
		solid_anim.play("Right")
		liquid_anim.play("Right")
		gas_anim.play("Right")
	elif get_parent().velocity.x < 0 and get_parent().is_on_floor():
		solid_anim.play("Left")
		liquid_anim.play("Left")
		gas_anim.play("Left")
	elif get_parent().velocity.x == 0 and get_parent().is_on_floor():
		solid_anim.play("Idle")
		liquid_anim.play("Idle")
		gas_anim.play("Idle")
	
	if get_node("../Jump").is_ascending:
		solid_anim.play("Jump")
		liquid_anim.play("Jump")
		gas_anim.play("Jump")
	elif !get_node("../Jump").is_ascending and !get_parent().is_on_floor():
		solid_anim.play("Fall")
		liquid_anim.play("Fall")
		gas_anim.play("Fall")
