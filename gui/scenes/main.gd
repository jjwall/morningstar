extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	print(Python.exec_test_picosdk_module(7, "hiiiii"))


func _on_button_2_pressed() -> void:
	print(Python.exec_test_mircatsdk_module("hey there", 11))
