# Traefik

## Descrição

O Traefik foi desenvolvido para atender a demanda de requisições web, então ele pode ser utilizado para fazer o roteamento das conexões de um site ou API para o container ou serviço que foi criada para isso.Em nosso caso será utilizado como Ingress.

## Arquitetura e Aplicação

O Traefik servirá como camada de Ingress para os acessos direcionados ao nossos POD's que contém o Grafana e o Prometheus, apontando para os seus respectivos serviços.

A configuração fornecida neste repositório permite a instalaão de um Traefik .

```

 ---------          ------------
| Traefik | <----> | Prometheus |
 ---------          ------------

 ---------          ---------
| Traefik | <----> | Grafana |
 ---------          ---------

```


## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação) 

Aplicar os manifestos para o GrafanaDB (MariaDB):
```
$ cd traefik22
$ kubectl apply -k . -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=traefik -n default
```