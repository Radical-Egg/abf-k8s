# planar-ally-k8s

Kubernetes Deployment for Planar Ally using [kruptein/planarally](https://hub.docker.com/r/kruptein/planarally/tags) image from Docker Hub. By default this application will be configured as a LoadBalancer service on port 8000. See the [Planar Ally Github Repo](https://github.com/Kruptein/PlanarAlly) for much more information on this application.

## Usage
```bash
helm repo add radical-egg https://radical-egg.github.io/pineapple-bun/
helm repo update
helm install planar-ally radical-egg/planar-ally-k8s
```

### Create User

```bash
kubectl exec -it \
    $(kubectl get pods | grep planar-ally-k8s | awk '{ print $1 }') \
    -- python -c "from src.db.all import User; User.create_new('admin', 'change_me')"
```

### List Users

```bash
kubectl exec -it \
    $(kubectl get pods | grep planar-ally-k8s | awk '{ print $1 }') \
    -- python -c "from src.db.all import User; [ print(u.name) for u in User.select() ]"
```

### Change Passowrd

```bash
kubectl exec -it \
    $(kubectl get pods | grep planar-ally-k8s | awk '{ print $1 }') \
    -- python -c "from src.db.all import User; 
        u = User.get(name='some-username'); u.set_password('new-passowrd'); u.save();"
```

## Storage Defaults

storage.kind can be set to `hostvol` or `persistentVolumeClaim`.

| Variable                                          | Default                               |
| --------                                          | -------                               |
| storage.kind                                      | hostvol                               |
| storage.hostvol.data                              | /data/pa-data                         |
| storage.hostvol.backups                           | /data/pa-assets                       |
| storage.pvc.data.size                             | 5Gi                                   |
| storage.pvc.data.storageClassName                 | false                                 |
| storage.pvc.assets.size                           | 1Gi                                   |
| storage.pvc.assets.storageClassName               | false                                 |

## Networking Defaults

| Variable                              | Default           |
| --------                              | -------           |
| networking.type                       | LoadBalancer      |
| networking.port                       | 8000              |
