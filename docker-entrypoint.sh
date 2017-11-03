#/bin/sh
OPTIONS="--server=https://$MINIKUBE_IP:8443 --username minikube --password '' --certificate-authority=/minikube/ca.crt --client-certificate=/minikube/client.crt --client-key=/minikube/client.key"
POD=$(kubectl $OPTIONS get po --namespace kube-system -l kubernetes.io/minikube-addons=registry -o jsonpath='{.items[0].metadata.name}')
exec kubectl $OPTIONS port-forward --namespace kube-system $POD 5000:5000
