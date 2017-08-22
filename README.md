# CSF AND DOCKER
If you have already open ports in csf.conf and you still can't connect to container use this

PS, Make sure you doesn't have any different rule for "DOCKER" Chain. or may this will fail!

(This script will restart docker, and csf at the end if you don't want to restart docker remove line **12** from install.sh)

```wget https://raw.githubusercontent.com/systemroot/csf-and-docker/master/install.sh```

```sh install.sh```

Then simply try to connect container again..
