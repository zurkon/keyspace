class_name WordList
extends Node

var _words := [
	"amber",
	"code",
	"chance",
	"different",
	"press",
	"series",
	"official",
	"garbage",
	"pursuit",
	"reach",
	"fall",
	"prediction",
	"mouse",
	"relevance",
	"game",
	"entertain",
	"magazine",
	"promotion",
	"throat",
	"traffic",
	"illustrate",
	"investment",
	"challenge",
	"color",
	"index",
	"jaw",
	"nun",
	"favour",
	"thumb",
	"packet",
	"vegetation",
	"element",
	"declaration",
	"shave",
	"disposition",
	"axis",
	"modest",
	"cluster",
	"double",
	"creep",
	"apology",
	"mold",
	"project",
	"soft",
	"diagram",
	"application",
	"headquarters",
	"attract",
	"follow",
	"realism",
]

var _available := _words
var _filtered := []
var _rng = RandomNumberGenerator.new()


func _init() -> void:
	_rng.randomize()
	print("palavras para jogar: ", _available.size())


func get_random_word() -> String:
	var new_word: String = ""
	var new_word_index: int = _rng.randi_range(0, _available.size() - 1)
	
	# If it's empty, refill
	if _available.size() == 0:
		_available = _words
	
	for i in _available.size():
		var first_slice := []
		var last_slice := []
		if i == new_word_index:
			if i != 0:
				first_slice = _available.slice(0, i-1)

			new_word = _available[i]
			_filtered.append(new_word)
			
			if i != _available.size() - 1:
				last_slice = _available.slice(i+1, _available.size() - 1)
			
			_available = first_slice
			
			if i != _available.size() - 1:
				_available.append_array(last_slice)
			break
	
	print("disponivel: ", _available.size())
	print("filtrado: ", _filtered.size())
	
	return new_word
