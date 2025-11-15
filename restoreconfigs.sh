docker pull psvkenobi/adventureworkslt-sql:2022
docker run -d \
  --name adventureworkslt-sql \
  -p 1433:1433 \
  -e "ACCEPT_EULA=Y" \
  -e "SA_PASSWORD=<PWD>" \
  psvkenobi/adventureworkslt-sql:2022
