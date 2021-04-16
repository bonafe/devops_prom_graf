# Monitoring (Kubernetes)

## Descrição

Este projeto ćontém os manifestos Kubernetes e instruções de instalação para cada uma das ferramentas que compõem o framework open source para Managed Services.

A descrição e processo de instalação de cada ferramenta estão disponíveis no README em cada repositório. 
As ferramentas disponíveis são:

- Prometheus
- AlertManager
- InfluxDB
- Grafana
- MariaDB (grafanadb)
- Consul
- NFS-provisioner
- Longhorn(Aplicado via apps no Rancher)
- Rancher

### Instalar Rancher - Single Node

Nesse tópico será isntalado o Rancher 2.2.5 versão single node. Isso significa que o Rancher e todos seus componentes estão em um container. 

Entrar no host que será usado para hospedar o Rancher Server. Iremos verficar se não tem nenhum container rodando ou parado, e depois iremos instalar o Rancher.
```sh
$ curl https://releases.rancher.com/install-docker/19.03.sh | sh
$ docker ps -a
$ docker run -d --name rancher --restart=unless-stopped -v /opt/rancher:/var/lib/rancher  -p 80:80 -p 443:443 rancher/rancher:latest
```
Com o Rancher já rodando, irei adicionar a entrada de cada DNS para o IP de cada máquina.

```sh
$ rancher.<dominio> = IP do host A
```

# K3S - Kubernetes on the Edge / Kubernetes Lightweight

https://k3s.io

https://rancher.com/docs/k3s/latest/en/

https://www.youtube.com/watch?v=WYPd7i15XOg&t=

https://www.slideshare.net/ShannonWilliams14/introducing-k3s-a-lightweight-kubernetes-distribution

# K3S - MASTER
$ sudo su
$ curl -sfL https://get.k3s.io | sh -

# Kubeconfig é escrito em  /etc/rancher/k3s/k3s.yaml
$ k3s kubectl get node

# Em um nó diferente, rode o código abaixo. NODE_TOKEN está em  /var/lib/rancher/k3s/server/node-token
	
	# K10feb7a2655de1631f87e50d2a4015a5fb4810dea253327da6c29a6c7d48004e4d::server:c3627e8c3b3a29c281daabb8311a3b44

	K10046df90fbfde67353f94d2ea625d6ea1e478591568b30f47a84aed3d5ba58d4a::server:b8577bbd3e7a56b4377d11a3a8bbecd6
	18.215.188.122

	curl -sfL https://get.k3s.io | K3S_URL=https://18.215.188.122:6443 K3S_TOKEN=K10046df90fbfde67353f94d2ea625d6ea1e478591568b30f47a84aed3d5ba58d4a::server:b8577bbd3e7a56b4377d11a3a8bbecd6 sh -

# NODE
# Logar no node1 - 
	curl -sfL https://get.k3s.io | K3S_URL=https://52.3.235.1:6443 K3S_TOKEN=K10b46e09ab152ef6b307c3cf52ce2fae56cf6054492404a55c3edddfcaba382b50::server:965b7b181d6193cc1593fd8b5babb9b3 sh -
	
	


$ curl -sfL https://get.k3s.io | K3S_URL=https://3.223.140.79:6443 K3S_TOKEN=K10feb7a2655de1631f87e50d2a4015a5fb4810dea253327da6c29a6c7d48004e4d::server:c3627e8c3b3a29c281daabb8311a3b44 sh -

# Logar no node2 - 
$ curl -sfL https://get.k3s.io | K3S_URL=https://3.223.140.79:6443 K3S_TOKEN=K10feb7a2655de1631f87e50d2a4015a5fb4810dea253327da6c29a6c7d48004e4d::server:c3627e8c3b3a29c281daabb8311a3b44 sh -


# IMPORTAR CLUSTER PARA RANCHER
# O COMANDO ABAIXO É OBTIDO AO ACESSAR A INTERFACE DO RANCHER E IR EM GLOBAL->ADD CLUSTER-> OTHER CLUSTER, dar um nome e pegar o comando        # similar ao abaixo
$ curl --insecure -sfL https://3.235.94.249/v3/import/l4nclrvdm4w5cp5f4lglt6g2gcjxmgkxg59hm6w7646kqvc7slq89p.yaml | k3s kubectl apply -f -


# Executar o Kubectl no seu SO ou integrador
$ kubectl get nodes

```