extends ProgressBar

func _ready():
	var ball = get_node("../../reddy")
	ball.health_neg.connect(health_neg)
	value=ball.health
	value=ball.health

func health_neg(new_health):
	value=new_health
	value=new_health
	emit_signal('godown',value)
	
	
