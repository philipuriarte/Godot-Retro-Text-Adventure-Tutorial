extends Node

func process_command(input: String) -> String:
	var words = input.split(" ", false)
	var first_word = words[0].to_lower()
	var second_word = ""
	
	if words.size() > 1:
		second_word = words[1].to_lower()
	
	match first_word:
		"go":
			return go(second_word)
		_:
			return "Invalid command - please try again."


func go(second_word: String) -> String:
	if second_word.empty():
		return "Go where?"
	
	return "You go %s" % second_word
