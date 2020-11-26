export ENVIRONMENT=prod
export DB_HOST=mysql
export DB_PORT=3306
export DB_USERNAME=root
export DB_PASSWORD=root
export DB_NAME=polkascan
export SUBSTRATE_RPC_URL=http://78.47.38.110:9933
export NETWORK_NAME=TOOLING
export NETWORK_ID=TOOLING

mysql:
	docker-compose -p polymesh -f docker-compose-local.yml up -d mysql

start:
	docker-compose -p polymesh -f docker-compose-local.yml up --build explorer-api harvester-api harvester-worker harvester-beat harvester-monitor redis explorer-gui

stop:
	docker-compose  -p polymesh -f docker-compose-local.yml stop explorer-api harvester-api harvester-worker harvester-beat harvester-monitor redis explorer-gui