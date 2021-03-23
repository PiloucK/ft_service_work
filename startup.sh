echo "Starting the cluster"
# touch minikube_trace
minikube start --vm-driver=docker
#  >> minikube_trace
# rm minikube_trace

eval $(minikube docker-env)

# Get the cluster's IP address and store it in a variable
CORRECT_CLUSTER_IP=$(kubectl get node -o wide | grep -oP  '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}') > /dev/null

# Replace the variable name in all files of the project by its value
sed -i -E "s/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/${CORRECT_CLUSTER_IP}/g" srcs/*/* > /dev/null

# echo "Addons loading\n"
# touch addons_trace
# minikube addons enable metrics-server >> addons_trace
# minikube addons enable logviewer >> addons_trace
# minikube addons enable dashboard >> addons_trace
# minikube addons enable metrics-server >> addons_trace
# rm addons_trace

# Metallb
echo "Metallb loading\n"
# touch metallb_trace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
#  >> metallb_trace
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#  >> metallb_trace
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#  >> metallb_trace
kubectl apply -f srcs/metallb/metallb-config-map.yaml
#  >> metallb_trace
# rm metallb_trace

# # Mysql
# echo "Mysql loading\n"
# touch mysql_trace
# docker build -t mysql srcs/mysql/ >> mysql_trace
# kubectl apply -f srcs/mysql/mysql.yaml >> mysql_trace
# rm mysql_trace

# Nginx
echo "Nginx loading\n"
# touch nginx_trace
docker build -t nginx srcs/nginx/
#  >> nginx_trace
kubectl apply -f srcs/nginx/nginx.yaml
#  >> nginx_trace
# rm nginx_trace

echo ${CORRECT_CLUSTER_IP}
# kubectl create namespace monitoring

# kubectl create secret generic influxdb-creds \
#   --from-literal=INFLUXDB_DATABASE=local_monitoring \
#   --from-literal=INFLUXDB_USERNAME=clkuznie \
#   --from-literal=INFLUXDB_PASSWORD=toto \
#   --from-literal=INFLUXDB_HOST=influxdb

# kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP
