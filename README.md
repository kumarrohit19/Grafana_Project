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

Dashboard
<img width="940" height="287" alt="image" src="https://github.com/user-attachments/assets/1328c9c7-ee3c-489a-9fa5-c5f5ed16eb8a" />

VMware Dashboards
<img width="940" height="431" alt="image" src="https://github.com/user-attachments/assets/d83e5f75-6312-44fa-aa63-62369ef2b512" />

<img width="940" height="442" alt="image" src="https://github.com/user-attachments/assets/994a2f4c-c99f-405f-9056-c74d5a80510d" />

Windows Server Dashboard
Backup Server
<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/165c1a90-c6fe-413d-8af4-6427cbc34dfc" />

Domain Controller
<img width="940" height="361" alt="image" src="https://github.com/user-attachments/assets/ab93117e-57c0-461d-99b6-7e0478250f85" />

Jump Server
<img width="940" height="449" alt="image" src="https://github.com/user-attachments/assets/6e8e3a7d-bf26-44be-9ad9-fa7620128176" />

Linux Server
<img width="940" height="406" alt="image" src="https://github.com/user-attachments/assets/170ac74c-b85c-4fd0-9c70-86e239306adf" />

