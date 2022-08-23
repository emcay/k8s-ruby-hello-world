# k8s-ruby-hello-world

Purpose:

To demonstrate a simple Ruby Rails hello world implimentation with helm argocd and nginx-ingress.

Prerequisites:

Install Docker:
https://docs.docker.com/engine/install/ubuntu/
Install Minikube:
https://minikube.sigs.k8s.io/docs/start/
Install Ruby:
https://www.ruby-lang.org/en/documentation/installation/
Install Helm:
https://helm.sh/docs/intro/install/

1. Build a simple Rails apps
https://guides.rubyonrails.org/getting_started.html

2. Set docker env for minikube and build docker container
eval $(minikube docker-env)
docker build -t ruby-hello-world .

3. Start minikube cluster (see pre-req for details)
Minikube Start

4. Get minikube ip
minikube ip

6. Create helm chart and configure parameters
https://helm.sh/docs/helm/helm_create/
*be sure to update ingres.host.hosts in values.yaml with correct nip.io hostname based off step 4
host: 192-168-49-2.nip.io

8. Upddate application.rb for your app to allow the .nip.io subdomain (section 3.5)
https://guides.rubyonrails.org/configuring.html

7. Deploy nginx-ingress
ingress-nginx

8. Create app namespace
kubectl create namespace ruby-hello-world

9. Deploy argocd:
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

10. Obtain argocd admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

11. Access argocd ui
kubectl port-forward svc/argocd-server -n argocd 8081:80

12. Deploy the app with argocd
https://argo-cd.readthedocs.io/en/stable/getting_started/
