import argparse

import docker


def main():
    parser = argparse.ArgumentParser(
        prog="test-entry",
    )
    parser.add_argument("imageid")
    args = parser.parse_args()

    client = docker.from_env()
    print(client.containers.run(args.imageid, "echo Hello World"))


if __name__ == "__main__":
    main()
