import argparse

def main(arg1: int, arg2: str):
    result = "hello from test_script1"
    print(arg1 + 3)
    print(arg2)
    print(result) # will need to json.stringify
    return result

# TODO: Use subcommands instead of multiple entry points.
def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("my_integer", type=int)
    parser.add_argument("my_string")
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    main(args.my_integer, args.my_string)