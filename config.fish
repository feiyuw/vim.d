# alias
alias vim='nvim'
alias kubectl='/usr/local/bin/kubectl'
alias tominikube='eval $(minikube docker-env)'

# env variables
set JAVA_HOME /usr/local/Cellar/openjdk@8/1.8.0+322
set MAVEN_HOME /usr/local/apache-maven-3.8.4
set PATH $JAVA_HOME/bin $MAVEN_HOME/bin $PATH

# golang
set GOPROXY https://mirrors.aliyun.com/goproxy/

# rust
source $HOME/.cargo/env

# homebrew mirror
set HOMEBREW_BOTTLE_DOMAIN https://mirrors.aliyun.com/homebrew/homebrew-bottles

# no greeting
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end
