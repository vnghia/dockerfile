import docker

client = docker.from_env()
print(client.images.list())
