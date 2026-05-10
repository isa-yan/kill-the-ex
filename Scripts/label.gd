extends Label

var value=100

func _ready():
	var player = get_node("../../reddy")
	player.health_neg.connect(health_neg)
	text=str(player.health)
	value=player.health

func health_neg(new_health):
	text=str(new_health)
	value=new_health
	emit_signal('godown',value)
	
	
	
