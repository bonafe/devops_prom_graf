# ArgoCD

## Descrição

ArgoCD é uma aplicação multi-plataforma para controle de alterações em ambiente K8s, garantindo o estado do cluster e das aplicações contidas no mesmo de acordo com o presente na master do repositório configurado.

## Arquitetura e Aplicação

O ArgoCD servirá como camada de proteção e controle para o cluster de monitoramento implementado garantindo assim o estado desejado de todas as aplicações e mantendo um local centralizado para deploy de quaisquer alterações do cluster e suas respectivas aplicações.

A configuração fornecida neste repositório permite a instalaão de um ArgoCD.


## Instalação

Pré-requisitos:
- rancher geranciando o cluster em questão
- kubectl (e respectivo ~/.kube/config para o cluster de Kubernetes alvo da instalação) 

Aplicar o ArgoCD para o cluster:
```
$ Na interface do Rancher ir até Apps e buscar por ArgoCD
$ Na janela que se abrir rolar selecionando o namespace desejado(default no nosso caso) e aplicar o ArgoCD no cluster(A instalação e deploy podem demorar até 5 minutos)
$ Após o deploy, abrir o cluster desejado na tela inicial do Rancher e acessar a opção Launch Kubectl.
$ No prompt que se abrir pegar o nome do pod em que foi feito o deploy do ArgoCD com o comando = "kubectl get pods -n default -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2"
$ Com o nome do pod em mãos vamos acessá-lo para trocar a senha default configurada(que nesse caso sempre é o nome do POD criado), executar o comando a seguir para acessar o POD = "kubectl -n argo-cd exec -it <nome_do_pod> -- bash"
$ Já dentro do POD do ArgoCD rodar o seguinte comando = "argocd login <ARGOCD_SERVER>"  # p.e localhost:8080 ou argocd.example.com
$ Será solicitado o user e senha, que por padrão é admin/<nome_do_pod>
$ Após login executar o comando a seguir para trocar a senha default = "argocd account update-password"
$ Acessar a UI(O endereço pode ser encontrado na tela do Rancher ao selecionar o namespace em que o Argo foi configurado).Essa informação fica logo abaixo do nome do POD argo-cd-argocd-server, clicar em um dos endereços abaixo dele e será aberta tela de login.
$ Feito login com user admin e senha configurada anteriormente, navegar até a engrenagem no lado esquerdo e configurar o seu repositório(GitHub,GitLab,etc)
$ Após configurado seu repositório pode voltar a tela inicial do ArgoCD e cadastrar suas aplicações a serem monitoradas e seus respectivos diretórios no repositório e toda vez que alguma mudança for aplicada na master do seu repo, ela refletirá em seu cluster k8s.
```
