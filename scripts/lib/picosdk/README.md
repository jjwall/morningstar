# PicoSDK

The install process described in the [picotech picosdk-python-wrappers](https://github.com/picotech/picosdk-python-wrappers/tree/master) repository does not seem to be set up appropriately. As a result we have to import the picosdk module by hand and update import statements to get it to work in the project's ``/scripts/lib`` directory.

This lib module pulls files from [picosdk](https://github.com/picotech/picosdk-python-wrappers/tree/master/picosdk). Since we're currently only working with the PS5000 series of PicoScopes, we aren't pulling in the other PicoScope series' Python wrappers.

A better practice would probably be using a git submodule to pull the library this way. As of now we've pulled changes from [this commit hash](https://github.com/picotech/picosdk-python-wrappers/tree/55c4897467617a219caa314dba8d779c91a35a55) from the picosdk-python-wrapper project.