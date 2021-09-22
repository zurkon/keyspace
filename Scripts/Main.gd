extends Node2D


onready var enemy_container = get_node("EnemySpawner/EnemyContainer")
onready var player = $Player


var active_enemy = null
var current_letter_index: int = -1
var current_prompt: String = ""


func find_new_active_enemy(typed_character: String):
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt()
		var first_character = prompt.substr(0, 1)
		if first_character == typed_character:
			active_enemy = enemy
			current_letter_index = 1
			current_prompt = enemy.get_prompt()
			print("Prompt atual: %s" % current_prompt)
			player.fire(active_enemy, current_letter_index, current_prompt)
			return


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		var typed_event = event as InputEventKey
		var key_typed = PoolByteArray([typed_event.unicode]).get_string_from_utf8()
		
		if active_enemy == null:
			find_new_active_enemy(key_typed)
		else:
			var next_character: String = current_prompt.substr(current_letter_index, 1)
			if key_typed == next_character:
				current_letter_index += 1
				player.fire(active_enemy, current_letter_index, current_prompt)
				if current_letter_index == current_prompt.length():
					current_letter_index = -1
					active_enemy = null
					current_prompt = ""
#		print("event: %s" % typed_event)
#		print("key: %s" % key_typed)
