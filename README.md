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
2. Update telegraf/telegraf.conf file as per your vcenter name and credentials and influxDb token generated while configuring it first time.
3. Update the docker-compose file as per your infra dns & Domain, for proper name resolution.
4. Create the docker containers by executing "docker compose up -d"

After containers are deployed, we need to configure it.

Configuring Grafana:
1. you can access the grafana using the URL http://IP-Address:3000
2. Default user "admin" password "admin".
3. After first login it will ask to update the credentials.
4. We need to configure to data sources prometheus for monitoring Windows and Linux VM's.
5. Once the data sources are added then we can create the dashboard.
6. Dashboard ID as below:
   8160 - For Linux VM
   16523 - For Windows Servers
   8162 - VMware
Note: For Windows and Linux Vm we need to Install prometheus-exporters for collecting metrics which can be reflected in grafana
Exporters can be found under exporter folder.

For configuring visualization for VMware Infra in Grafana, we need to configure influxDB & Telegraf.
InfluxDB Configuration Steps
1. Deploy influxdb container, here it will be deployed with the docker compose file along with other containers.
2. It needs to be configured during fist time login.
3. Access influxdb web page using the url "http:\\<container_name>:8086"
4. Set the user name, password,organisation name & Bucket name.
5. Follow the straightforward setup process, making note of all the details for use in later steps.
6. You will be presented with an API token. Keep this stashed away, as well. Because it cannot be retrived again, you will need to create new one incase lost.

Telegraf Configuration Steps:
1. Deploy Telegraf container, here it will be deployed with the docker compose file along with other containers.
2. you can download the telegraf.conf file and configure it as per the details mentioned.

Now you will need to add the dashboard for visualizing your vmware infra and map the influxDB as datasource
8159 - VMware dashboard ID

Adding influxDB Datasource in Grafana, follow the details as mentioned:
Name : influsDB
Query Language: Flux
URL: http://<container_name>:8086
under auth section enable Basic auth
Basic Auth
user: user_name
Password: enter password that you created during first login

InfluxDB Details
Organization: the name that you created during first login
Token: Enter the token generated during first config of influx, or you can generate new one for your bucket.
Default Bucket:Vmware
Min time interval: 10s
Max series: 1000

Click save and test. if every thing is good then it will be connected successfully.

Below are the snaps for reference:

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

