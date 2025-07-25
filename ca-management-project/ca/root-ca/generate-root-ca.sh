#!/bin/bash

# Set the variables for the root CA
ROOT_CA_DIR="./"
ROOT_CA_KEY="rootCA.key"
ROOT_CA_CERT="rootCA.crt"
ROOT_CA_DAYS=18250  # 50 years in days

# Create the root CA private key
openssl genrsa -out $ROOT_CA_DIR$ROOT_CA_KEY 4096

# Create the root CA certificate
openssl req -x509 -new -nodes -key $ROOT_CA_DIR$ROOT_CA_KEY -sha256 -days $ROOT_CA_DAYS \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=Root CA" \
    -out $ROOT_CA_DIR$ROOT_CA_CERT

echo "Root CA certificate and key generated successfully."