extends Node

const dev_python_path = '../scripts/main.py'
const prod_python_path = '../scripts/dist/morningstar_scripts/main.exe'

func _execute_python_script(args: PackedStringArray) -> Array:
	if Configs.env == Configs.env_types.DEV:
		print("EXECUTING FROM DEV ENV")
		var outputs = []
		var path_to_script: PackedStringArray = [dev_python_path]
		OS.execute("python", path_to_script + args, outputs, true)
		return outputs[0].split('\r\n')
	elif Configs.env == Configs.env_types.PROD:
		print("EXECUTING FROM PROD ENV")
		var outputs = []
		OS.execute(prod_python_path, args, outputs, true)
		return outputs[0].split('\r\n')
	else:
		return ['Set env configs']

func exec_test_picosdk_module(my_integer: int, my_string: String):
	var args = ['test_picosdk_module', my_integer, my_string]
	return _execute_python_script(args)

func exec_test_mircatsdk_module(my_string: String, my_integer: int):
	var args = ['test_mircatsdk_module', my_string, my_integer]
	return _execute_python_script(args)
