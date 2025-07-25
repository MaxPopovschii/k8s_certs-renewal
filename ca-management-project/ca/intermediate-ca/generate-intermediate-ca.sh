#!/bin/bash

# Set variables
INTERMEDIATE_CA_NAME="Intermediate CA"
DAYS_VALID=18250  # 50 years for the root CA
INTERMEDIATE_DAYS_VALID=5475  # 15 years for admin and QA developer
EXTERNAL_DAYS_VALID=730  # 2 years for external developer

# Create the intermediate CA directory structure
mkdir -p intermediate-ca/{certs,crl,newcerts,private}
chmod 700 intermediate-ca/private
touch intermediate-ca/{index.txt,serial}
echo 1000 > intermediate-ca/serial

# Generate the intermediate CA private key
openssl genrsa -out intermediate-ca/private/intermediate.key 4096

# Generate the intermediate CA certificate signing request (CSR)
openssl req -config openssl.cnf -new -key intermediate-ca/private/intermediate.key -out intermediate-ca/intermediate.csr -subj "/C=US/ST=State/L=City/O=Organization/CN=${INTERMEDIATE_CA_NAME}"

# Generate the intermediate CA certificate
openssl x509 -req -in intermediate-ca/intermediate.csr -CA ../root-ca/rootCA.pem -CAkey ../root-ca/private/rootCA.key -CAcreateserial -out intermediate-ca/intermediate.crt -days $INTERMEDIATE_DAYS_VALID -extfile openssl.cnf -extensions v3_intermediate_ca

echo "Intermediate CA generated successfully."