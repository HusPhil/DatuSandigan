extends CanvasLayer
@onready var tbtn_right: TouchScreenButton = $HBoxContainer/tbtn_right
@onready var tbtn_left: TouchScreenButton = $HBoxContainer/tbtn_left
@onready var tbtn_jump: TouchScreenButton = $HBoxContainer2/tbtn_jump
@onready var tbtn_otherweapon: TouchScreenButton = $HBoxContainer2/tbtn_otherweapon
@onready var tbtn_atk: TouchScreenButton = $HBoxContainer2/tbtn_atk
@onready var tbtn_pause: TouchScreenButton = $HBoxContainer3/tbtn_pause

@onready var weapon_list = [
	preload("res://res/arnis.tres"),
	preload("res://res/kampilan.tres"),
	preload("res://res/spell_book.tres"),
	preload("res://res/torch.tres")
]

var weapon_index = 0

func _on_tbtn_pause_pressed() -> void:
	tbtn_pause.modulate = Color(1,1,1,1)


func _on_tbtn_otherweapon_pressed() -> void:
	var player = get_parent().get_node("player")
	weapon_index = (weapon_index + 1) % weapon_list.size()
	var new_weapon = weapon_list[weapon_index]
	tbtn_otherweapon.modulate = Color(1,1,1,1)
	
	player.current_weapon = new_weapon
	print("Current weapon changed to:", player.current_weapon.name)


func _on_tbtn_right_pressed() -> void:
	tbtn_right.modulate = Color(1,1,1,1)

func _on_tbtn_right_released() -> void:	
	tbtn_right.modulate = Color(1,1,1,0.5)

func _on_tbtn_left_pressed() -> void:
	tbtn_left.modulate = Color(1,1,1,1)

func _on_tbtn_left_released() -> void:
	tbtn_left.modulate = Color(1,1,1,0.5)

func _on_tbtn_jump_pressed() -> void:
	tbtn_jump.modulate = Color(1,1,1,1)

func _on_tbtn_jump_released() -> void:
	tbtn_jump.modulate = Color(1,1,1,0.5)

func _on_tbtn_otherweapon_released() -> void:
	tbtn_otherweapon.modulate = Color(1,1,1,0.5)

func _on_tbtn_atk_pressed() -> void:
	tbtn_atk.modulate = Color(1,1,1,1)
	
func _on_tbtn_atk_released() -> void:
	tbtn_atk.modulate = Color(1,1,1,0.5)

func _on_tbtn_pause_released() -> void:
	tbtn_pause.modulate = Color(1,1,1,0.5)
