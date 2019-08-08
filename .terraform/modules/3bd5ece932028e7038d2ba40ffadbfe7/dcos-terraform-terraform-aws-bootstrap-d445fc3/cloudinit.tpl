#cloud-config
yum_repos:
  docker-ce:
    name: docker-ce
    description: Docker CE Repository
    baseurl: "https://download.docker.com/linux/centos/7/$basearch/stable"
    enabled: yes
    gpgcheck: yes
    gpgkey: https://download.docker.com/linux/centos/gpg
packages:
- docker-ce
runcmd:
  - [ systemctl, daemon-reload ]
  - [ systemctl, enable, docker.service ]
  - [ systemctl, start, --no-block, docker.service ]
  - setenforce 0
