# Morningstar

## Overview
Morningstar is an easy-to-use software application that orchestrates the functionalities of the [MIRcat](https://www.daylightsolutions.com/products/mircat/) quantum-cascade laser and [PicoScope 5444D](https://www.picotech.com/oscilloscope/5000/flexible-resolution-oscilloscope?kit=5444D) oscilloscope. Optical engineers can use Morningstar to rapidly run spectroscopic experiments such as identifying various types of molecules and their quantity present in test tubes. The goal of this project is to minimize the overhead required to initialize these instruments and provide a simple solution to automate this type of experimentation.

## How To Use
Coming soon...

## Software Architecture
### Python Scripting Layer
A [Python 3.10 environment](https://www.python.org/downloads/release/python-31011/) is used to interface with the PicoScope 5444D and MIRcat laser. A set of scripts to both initialize and automate these hardware devices can be found in ``/scripts``.

### GUI
A build of [Godot 4.3](https://godotengine.org/releases/4.3/) with low processor mode turned on is used for the Graphical User Interface to trigger and pass in flags to the scripts mentioned above. The code and files for the Godot application GUI can be found in ``/gui``.

### Dependencies

#### PicoSDK
The 64-bit version of the PicoSDK C Libraries is used by the PicoSDK Python wrappers within this project to interface with the PS5000 series of hardware devices. A download link of the binaries can be found [here](https://www.picotech.com/downloads/_lightbox/pico-software-development-kit-64bit) from Pico Technology's [downloads page](https://www.picotech.com/downloads). Going through the installer will add a system environment variable so the wrapper can access the PicoSDK DLLs. Downloading and installing the PicoSDK is required for Morningstar to function as designed.

#### MIRcat SDK
Coming soon...

## Builds
All versions of Morningstar can be downloaded [here](https://github.com/jjwall/morningstar/tags).

## Contributor Guide

### Python Environment Config
The GUI contains Python environment configs in [gui/autoload/globals/configs.gd](gui/autoload/globals/configs.gd).

The different environments are distinguished as follows:

```gdscript
enum python_env_types {
  VIRTUAL, # Targets Python interpeter in project's root level virtual env.
  SYSTEM, # Targets Python interpreter configured in system's environment.
  PACKAGE, # Targets Pyinstaller package. No Python interpeter necessary.
}
```

> <b>Note</b>: The Python environment can be modified by updating the value of the ``python_env`` global config variable.

When developing you'll likely be using the ``VIRTUAL`` or ``SYSTEM`` environment configs depending on your preference. ``PACKAGE`` should be used when testing the end deliverable.

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

> <b>Note</b>: The end user will have the option to switch between ``SYSTEM`` and ``PACKAGE`` environments within the GUI based on their experiment's requirements.

### Godot GUI
Download [Godot 4.3](https://godotengine.org/releases/4.3/) and extract the contents to your desired location. Run the ``Godot_v4.3-stable_win64.exe`` program and import the ``project.godot`` file that can be found here: [gui/project.godot](gui/project.godot).

Godot is a great tool for making video games and GUI driven software applications. If you're new to using it, [GDQuest](https://www.gdquest.com/) has some great free guides to get started with.

### Packaging
#### Python
Outside of the PicoSDK dependency, Morningstar is a clean, ready to run out-of-the-box piece of software. To do this, we use [PyInstaller](https://pyinstaller.org/en/stable/) to output an .exe program that includes all required Python dependencies (both the packages and the interpreter).

To package the latest changes into the .exe format, ``cd /scripts`` and run:

```powershell
pyinstaller pyinstaller.spec
```

This will bundle the Python scripts into a single executable called ``main.exe`` which can be found here: ``scripts/dist/morningstar/main.exe``.

#### Godot
Coming soon...

#### Makefile
Coming soon...