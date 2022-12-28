# actix-sqlx-vite
## Basic scaffolding for vite react-ts frontend, actix backend, & postgres database
---
## Running locally:
### Start up:
**Using script:**
```
# dev
. compose.sh
```
```
# prod
. compose.sh -e prod
```
**Using `docker-compose` directly:**
```
# dev
docker-compose -f docker-compose.dev.yml -d up
```
```
# prod
docker-compose -f docker-compose.prod.yml -d up
```
### Shut down:
**Using script:**
```
# dev
. compose.sh down
```
```
# prod
. compose.sh -e prod -c down
```
**Using `docker-compose` directly:**
```
# dev
docker-compose -f docker-compose.dev.yml -d down
```
```
# prod
docker-compose -f docker-compose.prod.yml -d down
```
---
for any questions, comments, or concerns please email myssynglynx@heat.tech
