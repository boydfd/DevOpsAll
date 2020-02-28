# DevOpsAll

主要用于本地部署K8s，并构建自己的一台开发环境的Ansible脚本，并且配置好各种镜像地址，加速各种包的下载。

### 用Ansible构建基础设施
支持：

* [x] k8s
* [x] Helm
* [x] Jenkins in k8s
* [x] NFS
* [x] Nginx ingress
* [x] Gitlab
* [ ] Dashboard

### 默认配置阿里云的各种镜像地址

* [x] yum
* [x] docker
* [x] pip

### 使用说明：

1. 需要有本地的dns支持.
2. 需要有一个docker镜像仓库，部署在192.168.0.101:5000
 (这个可以自行更改,但是我魔改了gitlab的helm，只能支持192.168.0.101:5000
, 所以需要用官方的版本gitlab [helm包](./files/gitlab-official-3.1.1.tgz))
3. 使用[VagrantFile](./files/Vagrantfile)自行构建虚拟机

