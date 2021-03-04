# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Setup the namespace 'monitoring' for clarity in big teams To delete after testing
minikube start

kubectl create namespace monitoring

kubectl create secret generic influxdb-creds \
  --from-literal=INFLUXDB_DATABASE=local_monitoring \
  --from-literal=INFLUXDB_USERNAME=clkuznie \
  --from-literal=INFLUXDB_PASSWORD=toto \
  --from-literal=INFLUXDB_HOST=influxdb

kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP
