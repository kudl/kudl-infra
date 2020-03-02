# k3s-traefik-ingress-example
Mac OS in Use VM and K3S Traefik Ingress Example

Here is an example of setting up K3S traefik ingress using Multipass on macOS.

Note that I used to run the example git, sample:
* [traefik](https://docs.traefik.io/)
* [multipass](https://multipass.run/)
* [hello sample application](https://github.com/paulbouwer/hello-kubernetes)

## Multipass Setting
Multipass install (use `homebrew`)
```
brew cask install multipass
```

K3S Master Node Server Launch & Start
```
multipass launch --name k3s-master --cpus 1 --mem 1024M --disk 3G
multipass start k3s-master
```

## K3S Install & Run
k3s-master server install k3s
```
multipass exec k3s-master -- /bin/bash -c "curl -sfL https://get.k3s.io | sh -"
K3S_NODEIP_MASTER="https://$(multipass info k3s-master | grep "IPv4" | awk -F' ' '{print $2}'):6443"
K3S_TOKEN="$(multipass exec k3s-master -- /bin/bash -c "sudo cat /var/lib/rancher/k3s/server/node-token")"
````

k3s-master server exec bash
```
multipass exec k3s-master -- /bin/bash
```

## Traefik Integess Deploy & Test
Set up the hello sample application using three files under the `deply > traefik` folder : traefik-ds.yaml, traefik-rbac.yaml, traefik-ui.yaml
```
sudo kubectl apply -f {your-file-path}/traefik-ds.yaml
sudo kubectl apply -f {your-file-path}/traefik-rbac.yaml
sudo kubectl apply -f {your-file-path}/traefik-ui.yaml
```

traefik pods, service check
```
sudo kubectl get pods, svc -n kube-system
```

`Usage traefik-ui test` :
* Check the IP of the multipass k3s-master server.
* Configure k3s-master host in / etc / hosts on mac os.
    * {your-multipass-k3s-master-ip} traefik-ui.minikube
* Access https: //traefik-ui.minikube in your browser

## hello Sample Application Deploy & Test
Set up the hello sample application using three files under the `deply > app folder` : hello-deployment.yaml, hello-service.yaml, hello-ingress.yaml.

```
sudo kubectl apply -f {your-file-path}/hello-deployment.yaml
sudo kubectl apply -f {your-file-path}/hello-service.yaml
sudo kubectl apply -f {your-file-path}/hello-ingress.yaml
```

hello pods, service check
```
sudo kubectl get pods,svc
```

hello application ingress check
```
sudo kubectl get Ingress
```

`Usage hello application ingress`:
* Check the IP of the multipass k3s-master server.
* Configure k3s-master host in / etc / hosts on mac os.
    * {your-multipass-k3s-master-ip} hello.com
* Hello.com in your browser
