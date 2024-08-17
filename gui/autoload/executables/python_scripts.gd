extends Node

const dev_python_path = '../scripts/test_script1.py'
const prod_python_path = '../scripts/dist/morningstar_scripts/test_script1.exe'

func _execute_python_script(args: PackedStringArray) -> Array:
	if Configs.env == Configs.env_types.DEV:
		print("DEV PATH")
		var outputs = []
		var path_to_script: PackedStringArray = [dev_python_path]
		OS.execute("python", path_to_script + args, outputs, true)
		return outputs[0].split('\r\n')
	elif Configs.env == Configs.env_types.PROD:
		print("PROD PATH")
		var outputs = []
		OS.execute(prod_python_path, args, outputs, true)
		return outputs[0].split('\r\n')
	else:
		return ['Set env configs']

func exec_test_script1(arg1: int, arg2: String):
	var args = [arg1, arg2]
	return _execute_python_script(args)
