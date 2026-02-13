autoload -Uz compinit
compinit


alias makecni='IMAGE=774305584254.dkr.ecr.us-east-1.amazonaws.com/amazon/amazon-k8s-cni make multi-arch-cni-build-push'
alias grep='grep --color=auto'

kenter() {
    if [ -z "$1" ]; then
        echo "Usage: kenter <node-name>"
        return 1
    fi
    kubectl debug node/$1 --image=public.ecr.aws/amazonlinux/amazonlinux:2023 --profile=sysadmin -it
}

# Kubernetes Aliases
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kdp='kubectl describe pod'
alias kdn='kubectl describe node'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'
alias kdel='kubectl delete'
alias krollout='kubectl rollout'
alias krolloutr='kubectl rollout restart'
alias krollouts='kubectl rollout status'

# Kubernetes Context Management
alias kcuc='kubectl config use-context'
alias kcgc='kubectl config get-contexts'
alias kccc='kubectl config current-context'
alias kk='kubectl -n kube-system'
alias kkgp='kubectl -n kube-system get pods'
alias kkgs='kubectl -n kube-system get services'
alias kkgd='kubectl -n kube-system get deployments'
alias kkdp='kubectl -n kube-system describe pod'
alias kkds='kubectl -n kube-system describe service'
alias kkdd='kubectl -n kube-system describe deployment'
alias kkl='kubectl -n kube-system logs'
alias kklf='kubectl -n kube-system logs -f'
alias kkex='kubectl -n kube-system exec -it'
alias kkdel='kubectl -n kube-system delete'
alias ls='ls --color=always'

# Pod Management
alias kgpw='kubectl get pods -o wide'
alias kgpall='kubectl get pods --all-namespaces'
alias kgpwatch='kubectl get pods -w'

# Kubernetes System Pods
alias ksys='kubectl --namespace kube-system'
alias kgsys='kubectl get --namespace kube-system'

# EKS Specific
alias eksctl='eksctl'
alias eksc='eksctl create'
alias eksd='eksctl delete'
alias eksg='eksctl get'
alias ekscc='eksctl create cluster'
alias eksdc='eksctl delete cluster'
alias eksgc='eksctl get cluster'

# Docker Aliases
alias d='docker'
alias dc='docker-compose'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dl='docker logs'
alias dlf='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'

# AWS ECR Specific
alias ecr-login='aws ecr get-login-password --region $(aws configure get region) | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query Account --output text).dkr.ecr.$(aws configure get region).amazonaws.com'
alias ecr-ls='aws ecr describe-repositories'
alias ecr-images='aws ecr describe-images --repository-name'

# Useful Functions
export AWS_DEFAULT_REGION='us-east-1'
export AWS_REGION='us-east-1'


source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
eval "$(starship init zsh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/.local/bin:$PATH"
