echo "Starting the cluster"
# touch minikube_trace
minikube start --vm-driver=docker
#  >> minikube_trace
# rm minikube_trace

eval $(minikube docker-env)

# Get the cluster's IP address and store it in a variable
CORRECT_CLUSTER_IP=$(minikube ip)

# Replace the variable name in all files of the project by its value
sed -i -E "s/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/${CORRECT_CLUSTER_IP}/g" srcs/*/*


# Create same certificates for all nginx using services
openssl dhparam -out srcs/tmp_cert/dh2048.pem 2048
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout srcs/tmp_cert/ft_service.key -out srcs/tmp_cert/ft_service.crt -subj "/C=FR/ST=IDE/L=Paris/O=42/OU=42/CN=ft_service.com"
cp srcs/tmp_cert/* srcs/nginx/cert
cp srcs/tmp_cert/* srcs/wordpress/cert
rm -f srcs/tmp_cert/*


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
# see what changes would be made, returns nonzero returncode if different
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

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


# Influxdb
# docker build -t influxdb srcs/influxdb/
# kubectl apply -f srcs/influxdb/influxdb.yaml


# Mysql
# echo "Mysql loading\n"
# touch mysql_trace
docker build -t mysql srcs/mysql/
#  >> mysql_trace
kubectl apply -f srcs/mysql/mysql.yaml
#  >> mysql_trace
# rm mysql_trace


# Nginx
echo "Nginx loading\n"
# touch nginx_trace
docker build -t nginx srcs/nginx/
#  >> nginx_trace
kubectl apply -f srcs/nginx/nginx.yaml
#  >> nginx_trace
# rm nginx_trace


# Wordpress
docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml


echo ${CORRECT_CLUSTER_IP}
# kubectl create namespace monitoring

# kubectl create secret generic influxdb-creds \
#   --from-literal=INFLUXDB_DATABASE=local_monitoring \
#   --from-literal=INFLUXDB_USERNAME=clkuznie \
#   --from-literal=INFLUXDB_PASSWORD=toto \
#   --from-literal=INFLUXDB_HOST=influxdb

# kubectl expose deployment influxdb --port=8086 --target-port=8086 --protocol=TCP --type=ClusterIP
