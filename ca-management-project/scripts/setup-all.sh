#!/bin/bash

# Set up the root Certificate Authority
echo "Setting up Root CA..."
cd ca/root-ca
bash generate-root-ca.sh

# Set up the intermediate Certificate Authority
echo "Setting up Intermediate CA..."
cd ../intermediate-ca
bash generate-intermediate-ca.sh

# Generate user certificates
echo "Generating Admin Certificate..."
cd ../user-certs/admin
bash generate-admin-cert.sh

echo "Generating QA Developer Certificate..."
cd ../qa-developer
bash generate-qa-cert.sh

echo "Generating External Developer Certificate..."
cd ../external-developer
bash generate-external-cert.sh

echo "All CA and user certificates have been set up successfully!"