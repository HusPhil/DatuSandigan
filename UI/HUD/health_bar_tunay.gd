extends ProgressBar

var parent
var max_value_amount
var min_value_amount

func _ready():
	parent = get_parent().get_parent()
	max_value_amount = parent.max_health
	min_value_amount = parent.min_health
	
func _process(delta):
	print(parent.health)
	self.value = parent.health
