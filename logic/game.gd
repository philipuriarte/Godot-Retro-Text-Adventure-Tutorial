extends Control


# Contains the input_response scene
const InputResponse = preload("res://scenes/input_response.tscn")

var max_scroll_len := 0

onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows
onready var scroll_con = $Background/MarginContainer/Rows/GameInfo/ScrollContainer
onready var scrollbar = scroll_con.get_v_scrollbar()


func _ready() -> void:
	scrollbar.connect("changed", self, "handle_scrollbar_changed")
	max_scroll_len = scrollbar.max_value


# Auto-scroll functionality
func handle_scrollbar_changed():
	if max_scroll_len != scrollbar.max_value:
		max_scroll_len = scrollbar.max_value
		scroll_con.scroll_vertical = max_scroll_len


# Instance InputResponse scene as a child to HistoryRows
func _on_Input_text_entered(new_text: String) -> void:
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "Response")
	history_rows.add_child(input_response)
