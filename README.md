# Jenkins in docker compose + Docker Agents

## Set the environment variables in the .env file
```code
vim .env
```
## Configure the Nginx Proxy
```code 
vim nginx/nginx.conf
```

## Start the infrastructure with docker compose
```code 
docker compose up -d
```

## Start key

The startup key is automatically generated and displayed at the top of the jenkins container log.

```code 
docker compose logs
```
Look for the following message
```code
| *************************************************************
| *************************************************************
| *************************************************************
| 
| Jenkins initial setup is required. An admin user has been created and a password generated.
| Please use the following password to proceed to installation:
| 
| xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
| 
| This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
| 
| *************************************************************
| *************************************************************
| *************************************************************
```
Access the designated url for your jenkins which can be localhost

http://localhost

When you start you will be asked for the KEY, then you can create the administrator user and start the configurations.

## CI Agentes

The agents are configured in their respective dockerfile based on the jenkins/ssh-agent:jdk11 image, we recommend copying from the examples and adding the required after the #PRIVILEGE session.
Our agents are configured with ssh

### Public Key
Run the following command
```code 
docker exec jenkins cat /id_rsa.pub
```      

The output must be assigned to the PUBKEY variable of the .env

### Private key
Run the following command
```code 
docker exec jenkins cat /id_rsa
```

Restart the infrastructure to update the changes

Use the output to create the Global credential that you will later use to connect the Agents

## Documentation

[Jenkins-Image](https://hub.docker.com/r/jenkins/jenkins)
[SSH-Agent](https://hub.docker.com/r/jenkins/ssh-agent)
[Install-Docker](https://docs.docker.com/engine/install)
