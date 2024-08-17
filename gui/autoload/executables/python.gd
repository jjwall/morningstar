extends Node

# Python program entry points.
const path_to_script_entry_point = '../scripts/main.py'
const path_to_exe_entry_point = '../scripts/dist/morningstar_scripts/main.exe'

# Python environment paths.
const local_python_path = '../.venv/Scripts/python.exe'
const dev_python_path = 'python' # assuming system variable is configured

#region Private python utility methods
func _execute_python_program(args: PackedStringArray) -> Array:
	if Configs.python_env == Configs.python_env_types.VIRTUAL:
		print("EXECUTING main.py USING PROJECT'S VIRTUAL PYTHON INTERPRETER")
		return _execute_plaintext_python_script(local_python_path, args)
	elif Configs.python_env == Configs.python_env_types.SYSTEM:
		print("EXECUTING main.py USING SYSTEM ENVIRONMENT'S PYTHON INTERPRETER")
		return _execute_plaintext_python_script(dev_python_path, args)
	elif Configs.python_env == Configs.python_env_types.PACKAGE:
		print("EXECUTING main.exe COMPILED FROM LATEST PYINSTALLER PACKAGE")
		return _execute_compiled_python_program(args)
	else:
		return ['Set env configs']

func _execute_plaintext_python_script(path_to_python_env: String, args: PackedStringArray) -> Array:
	var outputs = []
	var path_to_script: PackedStringArray = [path_to_script_entry_point]
	OS.execute(path_to_python_env, path_to_script + args, outputs, true)
	return outputs[0].split('\r\n')

func _execute_compiled_python_program(args: PackedStringArray) -> Array:
	var outputs = []
	OS.execute(path_to_exe_entry_point, args, outputs, true)
	return outputs[0].split('\r\n')
#endregion

#region Public python helpers to be consumed by GUI
func exec_test_picosdk_module(my_integer: int, my_string: String):
	var args = ['test_picosdk_module', my_integer, my_string]
	return _execute_python_program(args)

func exec_test_mircatsdk_module(my_string: String, my_integer: int):
	var args = ['test_mircatsdk_module', my_string, my_integer]
	return _execute_python_program(args)
#endregion
