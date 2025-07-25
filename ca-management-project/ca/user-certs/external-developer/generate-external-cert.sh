#!/bin/bash

# Variables
CERT_DIR="./certs"
DAYS_VALID=730  # 2 years
CERT_NAME="external-developer"

# Create certificate directory if it doesn't exist
mkdir -p $CERT_DIR

# Generate private key
openssl genrsa -out $CERT_DIR/$CERT_NAME.key 2048

# Generate certificate signing request (CSR)
openssl req -new -key $CERT_DIR/$CERT_NAME.key -out $CERT_DIR/$CERT_NAME.csr -subj "/CN=External Developer"

# Sign the certificate with the root CA
openssl x509 -req -in $CERT_DIR/$CERT_NAME.csr -CA ../root-ca/certs/ca.crt -CAkey ../root-ca/private/ca.key -CAcreateserial -out $CERT_DIR/$CERT_NAME.crt -days $DAYS_VALID

# Clean up
rm $CERT_DIR/$CERT_NAME.csr

echo "External developer certificate generated successfully!"