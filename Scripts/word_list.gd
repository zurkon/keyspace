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


func get_random_word() -> String:
	var new_word: String = ""
	var new_word_index: int = _rng.randi_range(0, _available.size() - 1)
	
	for i in _available.size():
		if i == new_word_index:
			var first_slice = _available.slice(0, i-1)
			new_word = _available[i]
			_filtered.append(new_word)
			var last_slice = _available.slice(i+1, _available.size() - 1)
			_available = first_slice
			_available.append_array(last_slice)
			break
	
	print(_available.size())
	
	return new_word
#	print("Nova Palavra: %s" % new_word_index)
#	print("Palavra selecionada: %s" % new_word)
#	print("Filtrados: %d" % _filtered.size())
#	print("Disponivel: %d" % _available.size())
#	print("Lista: %d" % _words.size())
