# K8s master Server scripts

## Ansible installation
```
# apt update -y && apt upgrade -y
# apt install ansible-core-y
```


## K8s node installation
```
# git clone https://github.com/kubernetes-sigs/kubespray.git --branch release-2.24
# vi kubescpray/inventory/mycluster/hosts.ini
# ansible-playbook -i inventory/mycluster/hosts.ini --become --become-user=root cluster.yml
```

```
## Configure 'ip' variable to bind kubernetes services on a
## different ip than the default iface
k8s-master-1 ansible_host=192.168.25.21 ip=192.168.25.21                
k8s-master-2 ansible_host=192.168.25.22 ip=192.168.25.22
k8s-master-3 ansible_host=192.168.25.23 ip=192.168.25.23

[kube-master]
k8s-master-1
k8s-master-2
k8s-master-3

[kube-node]
k8s-master-1
k8s-master-2
k8s-master-3

[etcd]
k8s-master-1

[k8s-cluster:children]  
kube-node
kube-master

[vault]
k8s-master-1
```

## Helm installation
```
wget https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz
tar -xvf helm-v3.14.4-linux-amd64.tar.gz
mv linux-admd64/helm /usr/bin/
```

## Kubernetes Dashboard installation
```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

vi admin-user-k8s.yml
kubectl apply -f admin-user-k8s.yml
```
```
apiVersion: v1
kind: ServiceAccount
metadata:  
  name: admin-user  
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:  
  name: admin-user
roleRef:  
  apiGroup: rbac.authorization.k8s.io  
  kind: ClusterRole  
  name: cluster-admin
subjects:
  - kind: ServiceAccount  
    name: admin-user  
    namespace: kubernetes-dashboard
---
apiVersion: v1
kind: Secret
metadata:  
  name: admin-user  
  namespace: kubernetes-dashboard  
  annotations:    
    kubernetes.io/service-account.name: "admin-user"
type: kubernetes.io/service-account-token
```

## Metric Server installation
```
# helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
# helm pull metrics-server/metrics-server
```

## Gitlab Runner installation
```
# curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
# apt install gitlab-runner -y
# gitlab-runner register

```

## ArgoCD installation
```
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Ingress-nginx installation
```
# helm repo add ingress-ngĩn https://kubernetes.github.io/ingress-ngĩn
# helm repo update
# helm pull ingress-nginx/ingress-nginx
```

