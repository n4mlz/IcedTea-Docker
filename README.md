[日本語版 README はこちら](https://github.com/n4mlz/IcedTea-Docker/blob/master/README-ja.md)

## IcedTea-Docker

IcedTea-Docker allows you to run Java Web Start applications (.jnlp files) on Docker, connecting to the host's X Server to display the GUI.

### Usage

Place your .jnlp file inside the ./files directory, and execute javaws ~/files/(your_file).jnlp within the container.

```bash
# Clone the repository
git clone git@github.com:n4mlz/IcedTea-Docker.git
cd IcedTea-Docker

# Copy your jnlp file to ./files
cp your_app.jnlp ./files

# Start Docker
docker compose up -d
docker exec -it icedtea bash

# The following operations are performed within the container
javaws ~/files/(your_file).jnlp
```
