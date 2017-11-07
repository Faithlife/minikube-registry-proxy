# Minikube Registry Proxy

minikube-registry-proxy runs as a container in your Docker Engine and proxies port 5000 to [Minikube](https://github.com/kubernetes/minikube).
This allows you to easily use locally built images in Minikube without requiring an external registry.

Tanmai Gopal explains this problem and general solution in [Sharing a local registry with minikube](https://blog.hasura.io/sharing-a-local-registry-for-minikube-37c7240d0615).
The minikube-registry-proxy solution works well with Docker for Mac (not just docker-machine) and uses the Minikube registry addon.
It allows your Docker version to be newer than the version supported by Minikube.

## Setup

1. Install [Minikube](https://github.com/kubernetes/minikube)

1. Enable the registry addon:

   `minikube addons enable registry`

1. Install the kube-registry-proxy DaemonSet:

   `kubectl apply -f https://github.com/Faithlife/minikube-registry-proxy/raw/master/kube-registry-proxy.yml`

1. Start the minikube-registry-proxy:

   `curl -L https://github.com/Faithlife/minikube-registry-proxy/raw/master/docker-compose.yml | MINIKUBE_IP=$(minikube ip) docker-compose -p mkr up -d`

You can now push images with a `localhost:5000/` tag prefix and pull them into Minikube.