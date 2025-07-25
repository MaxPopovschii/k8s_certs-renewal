# Intermediate Certificate Authority (CA) Setup

This document provides instructions on how to set up and use the Intermediate Certificate Authority (CA) within the CA management project. The Intermediate CA is crucial for issuing user certificates and managing the trust chain.

## Overview

The Intermediate CA is created under the Root CA and is responsible for issuing certificates to users and other entities. This setup allows for better management of certificates and enhances security by limiting the exposure of the Root CA.

## Prerequisites

- Ensure that the Root CA is set up and operational.
- OpenSSL must be installed on your system.

## Steps to Set Up the Intermediate CA

1. **Configure OpenSSL for the Intermediate CA**:
   - Modify the `openssl.cnf` file located in this directory to suit your requirements.

2. **Generate the Intermediate CA**:
   - Run the script to generate the Intermediate CA certificate and private key:
     ```bash
     ./generate-intermediate-ca.sh
     ```

3. **Verify the Intermediate CA**:
   - Check the generated certificate and ensure it is correctly signed by the Root CA.

## Issuing User Certificates

Once the Intermediate CA is set up, you can issue user certificates for different roles:

- **Admin Certificates**: Valid for 15 years.
- **QA Developer Certificates**: Valid for 15 years.
- **External Developer Certificates**: Valid for 2 years.

Refer to the respective README files in the `user-certs` directory for instructions on generating these certificates.

## Conclusion

You have successfully set up the Intermediate CA. Ensure to keep the private key secure and follow best practices for certificate management.