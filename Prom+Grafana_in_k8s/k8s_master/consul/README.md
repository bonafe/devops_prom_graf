# Consul

## Descrição
Consul é uma malha de serviços que provê funcionalidades de control plane com descoberta de serviços, configuração e segmentação. Cada funcionalidade pode ser individualmente utilizada conforme a necessidade.

Algumas das funcionalidades principais são:

- **Descoberta de serviços**: Serviços podem ser registrados e consumidos através do Consul, permitindo que aplicações possam encontrar os serviços que necessitam.
- **Health Checking**: Verificações podem fornecer informações sobre a disponibilidade do serviço associado e permitem que o Consul possa desviar tráfego de requisições de componentes não disponíveis.
- **KV (key-value) Store**: Fornece a possibilidade de armazenar configurações, feature flagging e outras informações de propósito geral à serem consumidas por aplicações externas.
- **Comunicação segura entre serviços**: Pode gerar e distribuir certificados TLS para estabelecer conexões TLS mútuas. Intenções são utilizadas para definir níveis de permissão na comunicação entre serviços e segmentá-los facilmente em tempo real.
- **Multi Datacenter**: não há necessidade de construir camadas de abstração para crescimento em múltiplas regiões.

## Arquitetura e Aplicação

Neste contexto, a funcionalidade de descoberta de serviços será utilizada pelo Prometheus, para atualização dinâmica do inventário de servidores a serem monitorados.

A instalação via manifestos do Kubernetes cria um StatefulSet, representando um cluster com três instâncias de servidores Consul. Agentes Consul externos podem ser adicionados ao conjunto para expandir os pontos de interação com o cluster principal.

```
----------        ----------        ----------
|Consul 1| <----> |Consul 2| <----> |Consul 3|
----------        ----------        ----------
```

A aplicação é exposta via Service em modo NodePort. Este modo foi escolhido pela simplicidade e compatibilidade com as distribuições de Kubernetes. Caso haja necessidade, um objeto Ingress poderá ser criado manualmente para expor a aplicação, adequando ao IngressController disponível no Kubernetes (NGINX, haproxy, Traefik, etc). Em caso de instalação no OpenShift, um objeto Route poderá ser criado para o mesmo fim.

## Instalação

Pré-requisitos:

- golang 1.15+
- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação)
- namespace "default" 
- longhorn



Aplicar os manifestos:

```
$ kubectl apply -f manifests/ -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=consul -n default
```