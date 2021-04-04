# Grafana

## Descrição

Grafana é uma aplicação multi-plataforma de visualização interativa e analytics. Fornece representações em gráficos e tabelas, e alertas quando conectado aos data sources. Expansível através de um sistema de plugins. Usuários finais podem criar dashboards complexos para monitoração usando seu construtor de queries interativo.

## Arquitetura e Aplicação

O Grafana servirá como camada de visualização para os dados coletados via Prometheus, fornecendo um front-end interativo e customizável para representação de informações relacionadas ao desempenho do ambiente monitorado.

A configuração fornecida neste repositório permite a instalaão de um Grafana e um banco de dados para armazenamento de informações internas do Grafana (como controle de usuários). 

```

 ---------          ---------
| Grafana | <----> | MariaDB |
 ---------          ---------

```

O Grafana não necessita obrigatoriamente de um banco de dados externo, contudo, para configurações de alta disponbilidade é necessário que as instâncias compartilhem uma mesma base de dados. Pensando neste cenário, a integração com o o MariaDB é padrão para as instalações provindas dos manifestos deste repositório.

```

                     ---------- 
                    | Grafana  |
                --->|    A     |---
               |     ----------    |
 -----------   |                   |     -----------
|    Load   |---                    --->|   Maria   | 
|  Balancer |  |     ----------    |    |     DB    |
 -----------   |    | Grafana  |   |     -----------
                --->|    B     |---
                     ---------- 

```

## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação)
- namespace "monitoring" 

Clonar o repositório:
```
$ git clone https://gitlab.icarotech.com/icarotech/managed-services/monitoring.git
$ cd monitoring/kubernetes/
```

Aplicar os manifestos para o GrafanaDB (MariaDB):
```
$ cd grafanadb
$ kubectl apply -f manifests/ -n monitoring
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=grafanadb -n monitoring
```

Aplicar os manifestos:

```
$ cd ../grafana
$ kubectl apply -f manifests/ -n monitoring
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=grafana -n monitoring
```