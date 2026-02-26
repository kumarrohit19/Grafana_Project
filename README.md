This Project will help you to understand how the servers are monitored in real life Infrastructure.

Tools that I have used for this Project are:
1. Ununtu VM - For hosting the Docker Containers
2. Grafana - For visualizing the utilizations
3. Prometheus - For collecting logs of unix and Windows Servers
4. telegraf - For collecting logs of vCenter Server
5. InfluxDB - For storing the metric collected from telegraf

Pre-Requisites:
Ubuntu VM 
Docker
Windows Server VM's
1 vCenter Appliance


Steps to follow:
1. Update prometheus/prometheus.yml as per your server names.
2. Update telegraf/telegraf.conf file as per your vcenter name and credentials.
3. Update the docker-compose file as per your infra dns & Domain
4. Create the docker containers by executing "docker compose up -d"

After containers are deployed, we need to configure it.

Configuring Grafana:
1. you can access the grafana using the URL http://IP-Address:3000
2. Default user "admin" password "admin".
3. After first login it will ask to update the credentials.
4. We need to configure to data sources prometheus & influxDB.
5. Once the data sources are added then we can create the dashboard.
6. Dashboard ID as below:
   8160 - For Linux VM
   16523 - For Windows Servers
   8162 - VMware
