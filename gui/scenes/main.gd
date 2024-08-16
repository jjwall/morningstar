extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	var outputs = []
	OS.execute('../scripts/dist/morningstar_scripts/test_script1.exe', [5, "hello"], outputs)
	print(outputs[0].split('\r\n'))


func _on_button_2_pressed() -> void:
	var outputs = []
	OS.execute('../scripts/dist/morningstar_scripts/test_script2.exe', [], outputs)
	print(outputs[0].split('\r\n'))
