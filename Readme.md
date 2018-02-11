# SSH in docker

## Why?

Frequently one has to do debugging in live environments where you might not actually

## Usage

An example usage would be that you ssh into this container, and forward some ports to another container in the private overlay network, to access e.g. a database through a port that is not visible outside the overlay network.

This way you can connect a GUI tool for said database on your local machine to 


```
docker run --rm --network MYNET -d -p 2222:22 jtilander/docker-ssh
```

This will connect the docker container to the internal MYNET network, and you can then access the containers from there.

Let's say we run a PostgreSQL database in the MYNET stack at the hostname mydatabase. We can then access it by a local tunnel via this command:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ServerAliveInterval=5 -o ServerAliveCountMax=1 -L localhost:5432:mydatabase:5432 -l root dockercontainerhost.myprovider.com:2222
```


## Environment variables

|Name|Default|Description|
|----|-------|-----------|
|KEYS_URL||We will download this URL and stick it as /root/.ssh/authorized_keys|


## Alternatives

* https://github.com/jeroenpeeters/docker-ssh -- webterminal for containers (much like rancher provides)
