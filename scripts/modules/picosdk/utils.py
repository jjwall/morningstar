import argparse

def init_subparsers(subparsers: argparse._SubParsersAction):
    parser_test_picosdk_module = subparsers.add_parser('test_picosdk_module')
    parser_test_picosdk_module.add_argument('my_integer', type=int)
    parser_test_picosdk_module.add_argument('my_string')
    parser_test_picosdk_module.set_defaults(func=test_picosdk_module)

def test_picosdk_module(args):
    print(args.my_integer)
    print(args.my_string)
    print("hi there picosdk")