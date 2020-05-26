This project provide zabbix installation with kubernetes. 

kubectl apply -f zabbix-config.yaml            
kubectl apply -f zabbix-mysql-server.yaml      
kubectl apply -f zabbix-mysql-service.yaml     
kubectl apply -f zabbix-server-mysql.yaml      
kubectl apply -f zabbix-backend-service.yaml   
kubectl apply -f zabbix-frontend-service.yaml  
kubectl apply -f zabbix-web-nginx-mysql.yaml   
kubectl apply -f zabbix-ingress.yaml

