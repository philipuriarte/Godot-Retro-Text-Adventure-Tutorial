extends Control


# Contains the input_response scene
const InputResponse = preload("res://scenes/input_response.tscn")

export (int) var max_lines_remembered := 30

var max_scroll_len := 0

onready var command_processor = $"%CommandProcessor"
onready var history_rows = $"%HistoryRows"
onready var scroll_con = $"%ScrollContainer"
onready var scrollbar = scroll_con.get_v_scrollbar()


func _ready() -> void:
	scrollbar.connect("changed", self, "handle_scrollbar_changed")
	max_scroll_len = scrollbar.max_value


# Auto-scroll functionality
func handle_scrollbar_changed():
	if max_scroll_len != scrollbar.max_value:
		max_scroll_len = scrollbar.max_value
		scroll_con.scroll_vertical = max_scroll_len


# Instances InputResponse scene as a child to HistoryRows
func _on_Input_text_entered(new_text: String) -> void:
	if !new_text.empty():
		var input_response = InputResponse.instance()
		input_response.set_text(new_text, "Response")
		history_rows.add_child(input_response)
		
		delete_old_history()


# Deletes HistoryRows children beyond limit
func delete_old_history():
	if history_rows.get_child_count() > max_lines_remembered:
		history_rows.get_child(0).queue_free()
