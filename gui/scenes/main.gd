extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	var outputs = Python.exec_capture_wavelengths()
	var voltages = str_to_var(outputs[1])
	#$WavelengthChart.plot_chart(voltages)
	#print(voltages)
	#$BarChart.plot_points(voltages)
	$MultiplotChart.plot_points(voltages)


func _on_button_2_pressed() -> void:
	$MultiplotChart.reset_chart()
	#print(Python.exec_test_mircatsdk_module("hey there", 11))
