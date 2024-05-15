[English README is here](https://github.com/n4mlz/IcedTea-Docker/blob/master/README.md)

## IcedTea-Docker

IcedTea を 使用してJava Web Startアプリケーション (`.jnlp` ファイル) を Docker 上で起動し、ホストの X Server に接続して GUI を表示します。

### Usage

`./files` の中に `.jnlp` ファイルを配置し、コンテナ内で `javaws ~/files/(your_file).jnlp` を実行してください。

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
