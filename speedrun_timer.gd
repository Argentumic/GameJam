extends Label

var time = SpeedruntTimerGlobal.SpeedrunTime
func _physics_process(delta: float) -> void:
	time = float(time) + delta
	
	updateUI()
	
func updateUI():
	text = str(roundf(time*1000)/1000)
	SpeedruntTimerGlobal.SpeedrunTime = text


	
