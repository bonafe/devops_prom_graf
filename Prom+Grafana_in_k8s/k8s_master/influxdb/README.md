# InfluxDB

## Descrição

InfluxDB é um TSDB (time series database) otimizado para armazemanto rápido e altamente disponível de dados em séries temporais, aplicado em campos como monitoração, metricas, IoT e analytics em tempo real. 

Não possui dependências externas e fornece uma linguagem *SQL-like* para consultas em estruturas de dados compostas de valores, séries e pontos. 

Cada ponto consiste em vários pares chave-valor, denominados *fieldsets* e um *timestamp*. Quando agrupados por um conjunto de pares chave-valor, definidos *tagsets*, isso caracteriza uma série. Séries agrupadas por um identificador (*strings*) são denominadas "medidas" ou "métricas".

## Arquitetura e Aplicação

O InfluxDB tem a função principal de servir como camada de persistência a longo prazo dos dados coletados pelo Prometheus. O Prometheus tem integração nativa com o InfluxDB usando a configuração de*remote storage* (*remote_read*, *remote_write*). Na configuração fornecida por este repositório, o Prometheus já é instalado com esta configuração habilitada, e portanto o InfluxDB deve ser instalado previamente.

```
 ----------          ------------
| InfluxDB | <----> | Prometheus |
 ----------          ------------
```

## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação)
- namespace "monitoring" 

Clonar o repositório:
```
$ git clone https://gitlab.icarotech.com/icarotech/managed-services/monitoring.git
$ cd monitoring/kubernetes/influxdb
```

Aplicar os manifestos:

```
$ kubectl apply -f manifests/ -n monitoring
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=influxdb -n monitoring
```
