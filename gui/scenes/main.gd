extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Console.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	var pre_trigger_sample_count: int = int($PreTriggerInput.text)
	var post_trigger_sample_count: int = int($PostTriggerInput.text)
	var outputs = Python.exec_capture_wavelengths(pre_trigger_sample_count, post_trigger_sample_count)
	var voltages = str_to_var(outputs[0])
	log_to_console("Voltages are as follows: " + outputs[0])
	$MultiplotChart.plot_points(voltages)


func _on_button_2_pressed() -> void:
	$MultiplotChart.reset_chart()
	#print(Python.exec_test_mircatsdk_module("hey there", 11))

func log_to_console(text):
	$Console.text = text
