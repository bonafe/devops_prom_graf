# Prometheus

## Descrição

O Prometheus é um aplicativo de software gratuito usado para monitoramento e alerta de eventos. Ele grava métricas em tempo real em um banco de dados de séries temporais criado usando um modelo de recepção HTTP, com consultas flexíveis e alertas em tempo real.

## Arquitetura e Aplicação

O Prometheus servirá como centralizador de monitoramento de servidores,aplicações e etc.


O Prometheus não necessita obrigatoriamente de um banco de dados externo, contudo, para persitência de dados por períodos mais longos de tempo é necessário que as instâncias compartilhem uma mesma base de dados. Pensando neste cenário, a integração com o o InfluDB é padrão para as instalações provindas dos manifestos deste repositório.

```

                     ---------- 
                   | Prometheus  |
                --->|    A     |---
               |     ----------    |
 -----------   |                   |     -----------
|    Load   |---                    --->|   Influx  | 
|  Balancer |  |     ----------    |    |     DB    |
 -----------   |  | Prometheus  |   |     -----------
                --->|    B     |---
                     ---------- 

```

## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação) 
- diretório /grafana_data e /grafana_data_prov criado em um servidor NFS e mapeado para os demais servidores.Lembrar de alterar no arquivo persist volume o IP do server NFS.
- Instalar o longhorn como storageclass usando o App's do Rancher no namespace Default.

Aplicar os manifestos para o InfluxDB:
```
$ cd influxdb
$ kubectl apply -f manifests/ -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=influxdb -n default
```

Aplicar os manifestos:

```
$ cd ../prometheus
$ kubectl apply -f manifests/ -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=prometheus -n default
```
