# grafana-env

Docker environment for developing and using grafana plugin

# mount.sh
Script to mount the plugin from a host folder (using VBox shared folder) if needed

# dev
Interactive container to build the plugin. After running
```
cd plugin
./install.sh -or- yarn install
```
Then to build
```
npm run build
```
Or watch
```
./watch.sh
```

# server
Grafana container scripts
To create storage volume
```
./storage
```
To run
```
./run -or- sudo ./run
```

