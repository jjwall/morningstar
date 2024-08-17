# Custom modules
from modules.picosdk import picosdk_utils

# Packages
import argparse

def main():
    # result = "hello from test_script1"
    # print(arg1 + 7)
    # print(arg2)
    # print(result) # will need to json.stringify
    # return result
    args = parse_args()
    args.func(args)

def parse_args():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(required=True)
    picosdk_utils.init_subparsers(subparsers)

    # parser.add_argument("my_integer", type=int)
    # parser.add_argument("my_string")
    return parser.parse_args()

if __name__ == "__main__":
    main()