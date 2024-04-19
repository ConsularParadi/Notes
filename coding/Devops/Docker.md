### Docker File
```
FROM <baseImage>
WORKDIR <working directory in docker>
COPY <copy all files from dir to docker>
RUN <runs commands before starting the container>
EXPOSE <required port of docker>
CMD ["foo", "bar"] <commands run after docker container is started>
```

> [!tip] 
> .dockerignore to ignore certain dirs while building containers
> 

### Commands
`docker build <path on machine> -t <tag name>` - build docker image from source files
`docker run <tag name>` - run container from image
`docker login` -> `docker push <tag name>` - for publishing images on docker hub
`docker pull <tag name>` - to pull containers from docker hub to run on machine

