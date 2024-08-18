extends Node

enum python_env_types {
	VIRTUAL, # Targets Python interpeter in project's root level virtual env.
	SYSTEM, # Targets Python interpreter configured in system's environment.
	PACKAGE, # Targets Pyinstaller package. No Python interpeter necessary.
}

const python_env: python_env_types = python_env_types.PACKAGE
