#!/bin/bash
echo "Starting SQL Server container."
IMAGE_NAME="sqlserver"
docker rm -f "${IMAGE_NAME}" 2>/dev/null
docker run -d \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=sqlpassword' \
    --name "${IMAGE_NAME}" \
    -p 1433:1433 \
    -d mcr.microsoft.com/mssql/server:2017-CU8-ubuntu || (
    echo "ERROR: Failed to start SQL Server Docker container."
    exit 1
)
