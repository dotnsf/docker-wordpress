# docker-wordpress

## 概要

**docker** を使って、複数の WordPress 環境を簡単に構築するためのシェルスクリプト

WordPress 環境１つを作るのは（docker-compose などを使えば）非常に簡単だが、（例えばテスト環境構築目的などで）独立した複数の WordPress 環境を、それも後から自由に追加できるように docker 環境内に構築できるようにするのは少し面倒だったりする。

そのような環境の構築を簡易化するためのシェルスクリプト


## 実行方法

- docker のインストール:

  - https://docs.docker.com/get-docker/ 参照

- [dockerhub](https://hub.docker.com/) からイメージを取得: (後述のコマンド時に実行されるので必須ではないが、あらかじめ行っておくとコマンド実行時間が短縮できる)

  - `$ docker pull mysql`

  - `$ docker pull wordpress`

- GitHub からシェルスクリプトを取得して、実行のための準備まで済ませる:

  - `$ git clone https://github.com/dotnsf/docker-wordpress`

  - `$ cd docker-wordpress`

  - `$ chmod 755 *.sh`

- docker 上で **MySQL** の起動:

  - `$ ./docker_run_mysql.sh`

- ここまでが済ませておくべき準備段階。WordPress 環境が必要になった場合に、必要なだけ以下を実行する

- **インデックス番号を指定して** docker 上に **WordPress** 環境を追加:

  - `$ ./docker_run_wordpress.sh 1` （インデックス番号 = 1 の場合）

    - このコマンドで追加した場合、WordPress は **8081** 番ポートで起動.

    - 初期セットアップ: `http://localhost:8081`.

    - 起動したコンテナ内にアクセスする場合のコマンド: `$ docker exec -it wordpress1 /bin/bash`.

    - コンテナを停止する場合のコマンド（データは消えません）: `$ docker stop wordpress1`.

    - 停止したコンテナを再起動する場合のコマンド: `$ docker start wordpress1`.

    - コンテナを削除する場合のコマンド（データが消え、MySQL のデータベースも drop されます）: `$ ./docker_rm_wordpress.sh 1`.

  - `$ ./docker_run_wordpress.sh 2` （インデックス番号 = 2 の場合）

    - このコマンドで追加した場合、WordPress は **8082** 番ポートで起動.

    - 初期セットアップ: `http://localhost:8082`.

    - 起動したコンテナ内にアクセスする場合のコマンド: `$ docker exec -it wordpress2 /bin/bash`.

    - コンテナを停止する場合のコマンド（データは消えません）: `$ docker stop wordpress2`.

    - 停止したコンテナを再起動する場合のコマンド: `$ docker start wordpress2`.

    - コンテナを削除する場合のコマンド（データが消え、MySQL のデータベースも drop されます）: `$ ./docker_rm_wordpress.sh 2`.


  - 同様にして好きなだけ WordPress 環境を追加できます。


## Copyright

2021 [K.Kimura @ Juge.Me](https://github.com/dotnsf) all rights reserved.
