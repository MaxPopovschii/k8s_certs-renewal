#!/bin/bash

# Variables
CERT_DIR="./certs"
KEY_DIR="./keys"
DURATION="5475" # 15 years in days
COMMON_NAME="QA Developer"

# Create directories if they don't exist
mkdir -p $CERT_DIR
mkdir -p $KEY_DIR

# Generate private key
openssl genrsa -out $KEY_DIR/qa-developer.key 2048

# Generate certificate signing request (CSR)
openssl req -new -key $KEY_DIR/qa-developer.key -out $CERT_DIR/qa-developer.csr -subj "/CN=$COMMON_NAME"

# Generate the certificate
openssl x509 -req -in $CERT_DIR/qa-developer.csr -CA ../root-ca/certs/ca.crt -CAkey ../root-ca/private/ca.key -CAcreateserial -out $CERT_DIR/qa-developer.crt -days $DURATION

# Clean up
rm $CERT_DIR/qa-developer.csr

echo "QA Developer certificate generated successfully!"