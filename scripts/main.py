# Custom modules
from modules import picosdk
# Packages
import argparse

# TODO: test out json.stringify outputs
def main():
    args = parse_args()
    args.func(args)

def parse_args():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(required=True)
    picosdk.init_subparsers(subparsers)

    # parser.add_argument("my_integer", type=int)
    # parser.add_argument("my_string")
    return parser.parse_args()

if __name__ == "__main__":
    main()