# Morningstar

## Overview
Morningstar is an easy-to-use software application that orchestrates the functionalities of the [MIRcat](https://www.daylightsolutions.com/products/mircat/) quantum-cascade laser and [PicoScope 5444D](https://www.picotech.com/oscilloscope/5000/flexible-resolution-oscilloscope?kit=5444D) oscilloscope. Optical engineers can use Morningstar to rapidly run spectroscopic experiments such as identifying various types of molecules and their quantity present in test tubes. The goal of this project is to minimize the overhead required to initialize these instruments and provide a simple solution to automate this type of experimentation.

## How To Use
Coming soon...

## Software Architecture
### Scripts
A [Python 3.10 environment](https://www.python.org/downloads/release/python-31011/) is used to interface with the PicoScope 5444D and MIRcat laser. A set of scripts to both initialize and automate these hardware devices can be found in ``/scripts``.

### GUI
A build of [Godot 4.3](https://godotengine.org/releases/4.3/) with low processor mode turned on is used for the Graphical User Interface to trigger and pass in flags to the scripts mentioned above. The code and files for the Godot application GUI can be found in ``/gui``.

## Builds
All versions of Morningstar can be downloaded [here](https://github.com/jjwall/morningstar/tags).

## Dev Setup

### Python Environment Config
The GUI contains python environment configs in ``gui/autoload/globals/configs.gd``

The different environments are distinguished as follows:

```gdscript
enum python_env_types {
	VIRTUAL, # Targets Python interpeter in project's root level virtual env.
	SYSTEM, # Targets Python interpreter configured in system's environment.
	PACKAGE, # Targets Pyinstaller package. No Python interpeter necessary.
}
```

### Virtual Environment Setup

To make use of the ``VIRTUAL`` Python environment mentioned above, perform the following steps:
* Install [Python 3.10.11](https://www.python.org/downloads/release/python-31011/)
* At root directory, create a virtual Python environment for the project by running:

```powershell
python -m venv .venv
```

* PowerShell users may need to run the following command to enable running Powershell scripts:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

* Activate the virtual Python environment by running:

```powershell
.\.venv\Scripts\Activate.ps1
```

* ``cd /scripts``

* Install Python dependencies by running:

```powershell
pip install -r requirements.txt
```
