cat > /workspaces/t-sql-learning/setup.sh << 'EOF'
#!/bin/bash

# Start SQL Server Docker container
docker-compose up -d

# Wait for SQL Server to start
sleep 15

# Run any initialization scripts if needed
echo "SQL Server is ready!"
EOF

chmod +x /workspaces/t-sql-learning/setup.sh