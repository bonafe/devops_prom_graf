# AlertManager

## Descrição

AlertManager é uma aplicação multi-plataforma de tratamento de alarmes recebidos através do Prometheus e os direciona para destinatários configurados, como por exemplo email,telegram,slack,webhook,etc.

## Arquitetura e Aplicação

O AlertManager servirá como camada de tratamento para os alertas coletados via Prometheus, fornecendo um front-end interativo para representação de informações relacionadas aos alarmes do ambiente monitorado.

A configuração fornecida neste repositório permite a instalaão de um AlertManager.

```

 ---------------         ------------
| AlertManager | <----  | Prometheus |
 ---------------         ------------

```

## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação) 
- Manifestos contidos em alertmanager/manifests

Aplicar os manifestos para o AlertManager:
```
$ cd alertmanager
$ kubectl apply -f manifests/ -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods --selector=app=alertmanager -n default
```