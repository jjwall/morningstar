# Morningstar

## Overview
The goal of this project is to provide initialization and automation scripts to assist optical engineers using a daisychain of hardware devices (the [MIRcat Mid-IR Laser](https://www.daylightsolutions.com/products/mircat/) and [PicoScope 5444D](https://www.picotech.com/oscilloscope/5000/flexible-resolution-oscilloscope?kit=5444D)) to easily run experiments.

Morningstar is an easy-to-use software that optical engineers can use to support experiments such as identifying various types of molecules and their quantity present in test tubes via this daisychain of instruments and spectroscopy.

## Software Architecture
### Scripts
A [Python 3.10 environment](https://apps.microsoft.com/detail/9pjpw5ldxlz5?hl=en-US&gl=US) is used to interface with the PicoScope 5444D and MIRcat laser. A set of scripts to both initialize and automate these hardware devices can be found in ``/scripts``.

### GUI
A non-realtime build of [Godot 4.3](https://godotengine.org/releases/4.3/) is used for the Graphical User Interface to trigger the scripts mentioned above. The code and files for the Godot application GUI can be found in ``/gui``.

## Builds
All versions of Morningstar can be downloaded [here](https://github.com/jjwall/morningstar/tags).