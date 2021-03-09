minikube start --vm-driver=docker

# Get the cluster's IP address and store it in a variable
CORRECT_CLUSTER_IP=$(kubectl get node -o wide | grep -oP  '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}')

# Replace the variable name in all files of the project by its value
sed -i -s "s/CORRECT_CLUSTER_IP/${CORRECT_CLUSTER_IP}/g" srcs/*/*

# Metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-config-map.yaml

# kubectl create namespace monitoring

# kubectl create secret generic influxdb-creds \
#   --from-literal=INFLUXDB_DATABASE=local_monitoring \
#   --from-literal=INFLUXDB_USERNAME=clkuznie \
#   --from-literal=INFLUXDB_PASSWORD=toto \
#   --from-literal=INFLUXDB_HOST=influxdb

# kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP
