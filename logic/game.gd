extends Control


# Contains the input_response scene
const InputResponse = preload("res://scenes/input_response.tscn")

# Contains the HistoryRows node
onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows
onready var scroll_container = $Background/MarginContainer/Rows/GameInfo/ScrollContainer
onready var scrollbar = scroll_container.get_v_scrollbar()


func _ready() -> void:
	scrollbar.connect("changed", self, handle_scrollbar_changed())


func handle_scrollbar_changed():
	pass


# Wil execute when user presses enter
func _on_Input_text_entered(new_text: String) -> void:
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "Response")
	history_rows.add_child(input_response)
