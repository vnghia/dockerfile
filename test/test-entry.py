import argparse
import json
from pathlib import Path

import docker


def main():
    parser = argparse.ArgumentParser(
        prog="test-entry",
    )
    parser.add_argument("imageid")
    parser.add_argument("testdata", type=Path)
    args = parser.parse_args()

    client = docker.from_env()

    if args.testdata.exits():
        with open(args.testdata, "r") as f:
            testdata = json.load(f)
            print(
                client.containers.run(
                    args.imageid, testdata.pop("command"), **testdata
                ).decode("utf-8")
            )


if __name__ == "__main__":
    main()
