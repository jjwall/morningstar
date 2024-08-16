# Morningstar

## Overview
Morningstar is an easy-to-use software that orchestrates the functionalities of the [MIRcat](https://www.daylightsolutions.com/products/mircat/) quantum-cascade laser and [PicoScope 5444D](https://www.picotech.com/oscilloscope/5000/flexible-resolution-oscilloscope?kit=5444D) oscilloscope. Optical engineers can use Morningstar to rapidly run spectroscopic experiments such as identifying various types of molecules and their quantity present in test tubes. The goal of this project is to minimize the overhead required to initialize these instruments and provide a simple solution to automate this type of experimentation.

## Software Architecture
### Scripts
A [Python 3.10 environment](https://apps.microsoft.com/detail/9pjpw5ldxlz5?hl=en-US&gl=US) is used to interface with the PicoScope 5444D and MIRcat laser. A set of scripts to both initialize and automate these hardware devices can be found in ``/scripts``.

### GUI
A non-realtime build of [Godot 4.3](https://godotengine.org/releases/4.3/) is used for the Graphical User Interface to trigger the scripts mentioned above. The code and files for the Godot application GUI can be found in ``/gui``.

## Builds
All versions of Morningstar can be downloaded [here](https://github.com/jjwall/morningstar/tags).