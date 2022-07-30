extends Control


const InputResponse = preload("res://scenes/input_response.tscn")


onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows

func _on_Input_text_entered(new_text: String) -> void:
	var input_response = InputResponse.instance()
	history_rows.add_child(input_response)
