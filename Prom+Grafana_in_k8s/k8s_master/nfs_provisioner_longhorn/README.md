# NFS-provisioner

## Descrição

O NFS-Provisioner vai prover um volume de armazenamento para a aplicação Grafana poder utilizar em várias instâncias.

## Arquitetura e Aplicação

O NFS-Provisioner servirá como PVC que usa o NFS criado entre os servidores de nosso cluster para compartilhamento de armazenamento via NFS entre os PODS do Grafana.



## Instalação

Pré-requisitos:

- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação) 
- longhorn(deploy feito via Apps do Rancher no cluster)
- Seguir os procedimentos do arquivo NFS-multiplos-nodes.txt na raiz desse projeto.

Aplicar os manifestos para o NFS-Provisioner:
```
$ cd nfs_provisioner_longhorn
$ kubectl apply -f security.yaml -n default
$ kubectl apply -f nfs-provisioner.yaml -n default
```

Conferir se a aplicação ocorreu com sucesso:

```
$ kubectl get pods -n default
```