import ctypes

from lib.picosdk.ps5000a import ps5000a as ps
from lib.picosdk.functions import adc2mV, assert_pico_ok, mV2adc

chandle = ctypes.c_int16()
status = {}

# device = ps.open_unit(None, resolution)

resolution = ps.PS5000A_DEVICE_RESOLUTION["PS5000A_DR_12BIT"] # type: ignore
status["openunit"] = ps.ps5000aOpenUnit(ctypes.byref(chandle), None, resolution) # type: ignore
# print(ps.ps5000aGetChannelInformation(chandle))

try:
    assert_pico_ok(status["openunit"])
    print("PicoScope 5444D successfully opened")
except: # PicoNotOkError:
    print("PicoNotOkError")
    powerStatus = status["openunit"]

    if powerStatus == 286:
        status["changePowerSource"] = ps.ps5000aChangePowerSource(chandle, powerStatus) # type: ignore
    elif powerStatus == 282:
        status["changePowerSource"] = ps.ps5000aChangePowerSource(chandle, powerStatus) # type: ignore
    else:
        raise

    assert_pico_ok(status["changePowerSource"])

# ps.close_unit(device)
ps.ps5000aCloseUnit(chandle) # type: ignore
print("PicoScope 5444D successfully closed")