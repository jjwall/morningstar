# Custom modules
from morningstar.modules.picosdk_utils import capture_wavelengths
from morningstar.modules import mircatsdk

# Packages
import argparse
# import numpy

# TODO: test out json.stringify outputs
def main():
    args = parse_args()
    args.func(args)

def parse_args():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(required=True)

    # Initialize subparsers.
    capture_wavelengths.init_subparsers(subparsers)
    mircatsdk.init_subparsers(subparsers)

    return parser.parse_args()

if __name__ == "__main__":
    main()