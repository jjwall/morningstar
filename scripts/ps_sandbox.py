# from lib.picosdk.discover import find_unit, find_all_units

# find_all_units()

# find_unit()
import ctypes

from lib.picosdk.ps5000a import ps5000a as ps
from lib.picosdk.functions import adc2mV, assert_pico_ok, mV2adc

chandle = ctypes.c_int16()
# status = {}


resolution = ps.PS5000A_DEVICE_RESOLUTION["PS5000A_DR_12BIT"]
device = ps.open_unit(None, resolution)

# status["openunit"] = ps.ps5000aOpenUnit(ctypes.byref(chandle), None, resolution)

# try:
#     assert_pico_ok(status["openunit"])
# except: # PicoNotOkError:
#     print("PicoNotOkError")
#     powerStatus = status["openunit"]

#     if powerStatus == 286:
#         status["changePowerSource"] = ps.ps5000aChangePowerSource(chandle, powerStatus)
#     elif powerStatus == 282:
#         status["changePowerSource"] = ps.ps5000aChangePowerSource(chandle, powerStatus)
#     else:
#         raise

#     assert_pico_ok(status["changePowerSource"])

ps.close_unit(device)