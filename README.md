# Polkascan Open-Source
Polkascan Open-Source Application

## Quick local deployment
### Step 1: Clone repository: 
```bash
git clone https://github.com/polymathnetwork/polkascan-os.git
```
### Step 2: Change directory: 
```bash
cd polkascan-os
```
### Step 3: Check available releases: 
```bash
git tag
```
### Step 4: Checkout latest releases: 
```bash
git checkout beta
```
### Step 5: Make sure to also clone submodules within the cloned directory: 
```bash
git submodule update --init --recursive
```
### Step 6: During the first run let MySQL initialize (wait for about a minute)
```bash
docker-compose -p polymesh -f docker-compose-local.yml up -d mysql
```
### Step 7: Then build the other docker containers
```bash
docker-compose -p polymesh -f docker-compose-local.yml up --build
```

## Links to applications
* Polkascan Explorer GUI: http://127.0.0.1:8080
* Monitor harvester progress: http://127.0.0.1:8080/kusama/harvester/admin
* Harvester Task Monitor: http://127.0.0.1:5555
* Polkadot JS Apps: http://127.0.0.1:8081

## Add custom types for Substrate Node Template

* Modify `harvester/app/type_registry/substrate-node-template.json` to match the introduced types of the custom chain
* Truncate `runtime` and `runtime_*` tables on database
* Start harvester
* Check http://127.0.0.1:8080/node-template/runtime-type if all type are now correctly supported
* Monitor http://127.0.0.1:8080/node-template/harvester/admin if blocks are being processed and try to restart by pressing "Process blocks in harvester queue" if process is interupted.

## Cleanup Docker
Use the following commands with caution to cleanup your Docker environment.

### Prune images
```bash
docker system prune
```

### Prune images (force)
```bash
docker system prune -a
```

### Prune volumes
```bash
docker volume prune
```
