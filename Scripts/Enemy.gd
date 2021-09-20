extends KinematicBody2D


export var target_color := Color("#ff5722")
export var letter_color := Color("#b71c1c")
export var text := 'type here'


onready var prompt = $RichTextLabel
onready var prompt_text = prompt.text


func _ready() -> void:
	set_prompt()


func get_prompt() -> String:
	return prompt_text


func set_prompt() -> void:
	prompt_text = text
	prompt.parse_bbcode("[center]" + text + "[/center]")


func set_next_character(next_character_index: int) -> void:
	var target_text = get_color_tag(target_color) + prompt_text.substr(next_character_index, prompt_text.length()) + get_end_color_tag()
	prompt.parse_bbcode("[center]" + target_text + "[/center]")
	if next_character_index == prompt_text.length():
		queue_free()


func get_color_tag(color: Color) -> String:
	return "[color=#" + color.to_html(false) + "]"


func get_end_color_tag() -> String:
	return "[/color]"


func _on_Enemy_tree_exiting() -> void:
	print(get_tree().current_scene.name)
	print("Destroyed!!!!")
