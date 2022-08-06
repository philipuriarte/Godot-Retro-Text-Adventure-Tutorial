extends Node

func process_command(input: String):
	var words = input.split(" ", false)
	var first_word = words[0].to_lower()
	var second_word = words[1].to_lower()
	
	match first_word:
		"go":
			go(second_word)


func go(second_word: String):
	pass
