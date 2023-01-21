import argparse
import json
from pathlib import Path

import docker
from docker.errors import ContainerError


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
            entrypoint = test_data.pop("entrypoint", ["/bin/bash", "-l", "-c"])
            volumes = test_data.pop("volumes", []) + [
                str(Path.cwd().resolve()) + ":" + test_path
            ]
            working_dir = test_data.pop("working_dir", test_path)
            try:
                print(
                    client.containers.run(
                        args.imageid,
                        test_data.pop("command"),
                        entrypoint=entrypoint,
                        volumes=volumes,
                        working_dir=working_dir,
                        **test_data,
                    ).decode("utf-8")
                )
            except ContainerError as exc:
                print(exc.container.logs().decode("utf-8"))
                raise exc
    else:
        print(
            f"::warning ::Test data file ({args.testdata}) not found. No tests will be performed."
        )


if __name__ == "__main__":
    main()
