extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	print(Python.exec_test_script1(7, "hiiiii"))


func _on_button_2_pressed() -> void:
	var outputs = []
	OS.execute('../scripts/dist/morningstar_scripts/test_script2.exe', [], outputs, true)
	print(outputs[0].split('\r\n'))
