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

    if args.testdata.exists():
        with open(args.testdata, "r") as f:
            test_data = json.load(f)
            test_path = "/test"
            volumes = test_data.pop("volumes", []) + [
                str(Path.cwd().resolve()) + ":" + test_path
            ]
            working_dir = test_data.pop("working_dir", test_path)
            print(
                client.containers.run(
                    args.imageid,
                    test_data.pop("command"),
                    volumes=volumes,
                    working_dir=working_dir,
                    **test_data
                ).decode("utf-8")
            )


if __name__ == "__main__":
    main()
