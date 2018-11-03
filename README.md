### Windows Mac Unbuntu + Gem5 docker container

Dockerfile for automated gem5 build from public repositories on gem5.org

gem5 source directory is put in `/usr/local/src/gem5`

gem5 binary is in `/usr/local/bin/gem5.opt`

1. docker dowload [docker](https://www.docker.com/get-started), set docker memory > 2 G

2. git clone https://github.com/shaheming/docker-gem5.git

#### Build image

 ```shell
cd docker-gem5
docker build . -t + <image tag name, like ubuntu1604:v1>
# like docker build . -t ubuntugem5:v1
docker run -it -v `pwd`:/root/work <image tag name, like ubuntu1604:v1> bash
# docker run -it -v `pwd`:/root/work ubuntugem5:v1
# this will map your current director to the image at ~/work

docker ps -a 
# to show exit docker container name in the last column

# if you want to open in a new terminal
docker exec -it <container name> bash
# exit container
exit

#if you exit  container in all terminals, container will be stoped.
#to the restart comtainer
docker ps -a 
# this will show stoped container's name

# start an exited docker
docker start <container name>
# then
docker exec -it <container name> bash 

# test gem5
/usr/local/bin/gem5.opt /usr/local/src/gem5/configs/example/se.py -c /usr/local/src/gem5/tests/testprogs/hello/bin/x86/linux/hello
 ```



Video tutorial: https://youtu.be/ZVauNzx5QUU