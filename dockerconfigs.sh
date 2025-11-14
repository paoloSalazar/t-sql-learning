# Create docker configuration files
cat > /workspaces/t-sql-learning/Dockerfile << 'EOF'
FROM mcr.microsoft.com/mssql/server:latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourPassword123

EXPOSE 1433
EOF

cat > /workspaces/t-sql-learning/docker-compose.yml << 'EOF'
version: '3.8'
services:
  sqlserver:
    image: mcr.microsoft.com/mssql/server:latest
    environment:
      ACCEPT_EULA: "Y"
      SA_PASSWORD: "YourPassword123"
    ports:
      - "1433:1433"
    volumes:
      - sqlserver_data:/var/opt/mssql
volumes:
  sqlserver_data:
EOF