# Kasm DesignCraft
DesignCraft (https://github.com/storytold/designcraft) docker image for Kasm Workspaces (https://kasm.com)

Built for `linux/amd64` and `linux/arm64`. The latest DesignCraft release `.deb` is installed at build time.

Load this image into Kasm Workspaces by adding the Sully's Choice Kasm Workspace Registry: https://sullyschoice.github.io/kasm-registry/

## Manual Run

```bash
sudo docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password sccr.sullyschoice.net/sullyschoice/kasm-designcraft:latest
```

Access via your browser: `https://<your ip>:6901` username: `kasm` , password: `password`

## Build
```bash
sudo docker build -t kasm-designcraft:latest -f Dockerfile .
```

To pin a specific DesignCraft version:
```bash
sudo docker build --build-arg DESIGNCRAFT_VERSION=0.7.1 -t kasm-designcraft:0.7.1 -f Dockerfile .
```
