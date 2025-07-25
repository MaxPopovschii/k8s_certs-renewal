#!/bin/bash

# Variables
CERT_DIR="./certs"
DAYS_VALID=5479  # 15 years in days
ADMIN_CERT="admin-cert.pem"
ADMIN_KEY="admin-key.pem"

# Create certificate directory if it doesn't exist
mkdir -p $CERT_DIR

# Generate private key for admin
openssl genrsa -out $CERT_DIR/$ADMIN_KEY 2048

# Generate certificate signing request (CSR)
openssl req -new -key $CERT_DIR/$ADMIN_KEY -out $CERT_DIR/admin.csr -subj "/CN=Admin/O=YourOrganization/C=YourCountry"

# Sign the CSR with the root CA to create the admin certificate
openssl x509 -req -in $CERT_DIR/admin.csr -CA ../root-ca/certs/ca-cert.pem -CAkey ../root-ca/private/ca-key.pem -CAcreateserial -out $CERT_DIR/$ADMIN_CERT -days $DAYS_VALID

# Clean up
rm $CERT_DIR/admin.csr

echo "Admin certificate generated: $CERT_DIR/$ADMIN_CERT"
echo "Admin private key generated: $CERT_DIR/$ADMIN_KEY"