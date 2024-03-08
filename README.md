## DockerDemo
Copy dockerfile and nginx.conf in the project root

### Build docker image with following command in project root
``` bash
docker build -t organization_name/app_name:latest .
``` 
### run following command to run application in docker (this will generate container)
``` bash
docker run -d -p 8080:4200 organization_name/app_name:latest
```

### For hosting in digital ocean
1. push docker image to a registry like docker hub

        1. login to docker hub

         
        docker login -u <username> -p <password>
        
        2. push image to docker hub

            docker push  organization_name/app_name:latest
2. login  digital ocean create a droplet
3. open droplet commandline and install docker
4. pull docker image
5. run image using above docker run command 