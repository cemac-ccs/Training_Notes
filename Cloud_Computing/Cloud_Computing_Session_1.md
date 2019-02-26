# Training notes for the SWD4:Cloud Computing course.

Slides can be found at http://bit.ly/swd4cloud

Things to remember: 
* You can get small grants from [AWS](https://aws.amazon.com/grants/), [Azure](https://www.microsoft.com/en-us/research/academic-program/microsoft-azure-for-research/) and [GCloud](https://cloud.google.com/edu/) etc. 
* You can also set up an entire business with no defined infrastructure.
* This is called **IaaS** (Infrastructure as a Service)

There is a University Cloud Policy [here](https://goo.gl/ivTHWR). Basically, make sure everything is encrypted of course.


## GCloud and Colaboratory

Colaboratory is a thing similar to jupyter notebooks. You can use python, or with a ! precursor you can use bash scripting.

## GCloud in the command line

You can set up a VM from the command line, and infact by going through the online system you can get a command line dump which can be used later in the GCloud shell to set up a VM with exactly the same settings. for example, the commands below:
```bash
gcloud compute --project=swd4-cloud-computing instances create swd4-vm1-rstudio --zone=europe-west2-c --machine-type=n1-standard-2 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=410993972280-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --image=ubuntu-1604-xenial-v20190212 --image-project=ubuntu-os-cloud --boot-disk-size=50GB --boot-disk-type=pd-standard --boot-disk-device-name=swd4-vm1-rstudio

gcloud compute --project=swd4-cloud-computing firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

gcloud compute --project=swd4-cloud-computing firewall-rules create default-allow-https --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server
```

Virtual Machines are at the centre of Cloud computing. There are instructions for setting up a VM [here](https://docs.google.com/document/d/1BdKBTSyRhvDHGik-i_hmaz6iyCbFDbGMVs8bMIMfWO0) with instructions on how to set up a GUI for the operating system [here](https://medium.com/google-cloud/graphical-user-interface-gui-for-google-compute-engine-instance-78fccda09e5c)
