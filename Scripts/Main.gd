extends Node2D


onready var enemy_container = $EnemyContainer
onready var player = $Player


var active_enemy = null
var current_letter_index: int = -1


func find_new_active_enemy(typed_character: String):
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt()
		var first_character = prompt.substr(0, 1)
		if first_character == typed_character:
			active_enemy = enemy
			current_letter_index = 1
			player.fire(active_enemy, current_letter_index)
#			active_enemy.set_next_character(current_letter_index)
			return


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var typed_event = event as InputEventKey
		var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()
		
		if active_enemy == null:
			find_new_active_enemy(key_typed)
		else:
			var prompt: String = active_enemy.get_prompt()
			var next_character: String = prompt.substr(current_letter_index, 1)
			if key_typed == next_character:
				current_letter_index += 1
				player.fire(active_enemy, current_letter_index)
#				active_enemy.set_next_character(current_letter_index)
				if current_letter_index == prompt.length():
					print("Reset!")
					current_letter_index = -1
					active_enemy = null
#		print("event: %s" % typed_event)
#		print("key: %s" % key_typed)
