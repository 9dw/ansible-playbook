# ansible-playbook
サーバ構成構築ツールansibleのリポジトリです

## ● Playbook

### setup_nvidia_docker
* 必要なパッケージをインストールするロール 
* docker と docker-compose をインストールするロール 
* nvidia-driver をインストールするロール 
* nvidia-docker をインストールするロール 
* dcgm-exporter をインストールするロール 

### setup_docker
* 必要なパッケージをインストールするロール 
* docker と docker-compose をインストールするロール 
* node-exporter をインストールするロール 

## ● Requirement

### コントロールノード（管理サーバー）のインストール要件

* CPUやメモリに関する公式要件なし
* ターゲットノードとのネットワーク通信可能な状態
* python2（2.6 or 2.7）またはPython3 (3.5以上)
* windowsマシンは不可
* ansibleは2.7以上推奨

### ターゲットノード（変更対象サーバー）のインストール要件

* Python2.6以上

## ● Installation

### コントロールノードがMacOSの場合

```
brew install ansible
```

### コントロールノードがUbuntuの場合

```
sudo apt update
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

## ● Usage
管理ノードで以下のコマンドを実行してください．

```
ansible-playbook -u <user_name> -i <target_ip>, <playbookのファイルパス> <options>
```

\<options> について

* 「--private-key=<private-key>」で秘密鍵の場所指定
* 「--skip-tags <role名>」で対象のrole処理をスキップできる

## ● Note
Ubuntu 18.04 で検証済み

### setup_nvidia_docker
* [docker for ubuntu](https://download.docker.com/linux/ubuntu/)
* docker-compose は 1.23.1（[docker-compose release](https://github.com/docker/compose/releases/)）
* nvidia-driver は自動インストールされる
* [nvidia-docker for ubuntu18.04](https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list)
* [nvidia/dcgm-exporter](https://hub.docker.com/r/nvidia/dcgm-exporter)

### setup_docker
* [docker for ubuntu](https://download.docker.com/linux/ubuntu/)
* docker-compose は 1.23.1（[docker-compose release](https://github.com/docker/compose/releases/)）
* [prometheus/node-exporter](quay.io/prometheus/node-exporter)

## ● Author
* [9dw](https://github.com/9dw)
* [ikuhiroo](https://github.com/ikuhiroo)
* [hikimochi](https://github.com/hikimochi)

## ● License
This software is released under the MIT License, see LICENSE.
