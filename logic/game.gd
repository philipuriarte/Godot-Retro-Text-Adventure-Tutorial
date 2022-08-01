extends Control


# Contains the input_response scene
const InputResponse = preload("res://scenes/input_response.tscn")

# Contains the HistoryRows node
onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows


# Wil execute when user presses enter
func _on_Input_text_entered(new_text: String) -> void:
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "Response")
	history_rows.add_child(input_response)
