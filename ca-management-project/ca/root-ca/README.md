# Root Certificate Authority (CA) Setup

This document provides instructions on how to set up and use the Root Certificate Authority (CA) for the ca-management-project. The Root CA is designed to be a long-lived CA with a validity of **50 years**.

## Prerequisites

Before proceeding, ensure you have the following:

- OpenSSL installed on your system.
- Access to a terminal with appropriate permissions to execute scripts.

## Directory Structure

The Root CA files are located in the `ca/root-ca` directory. The key files include:

- **openssl.cnf**: Configuration file for OpenSSL, specifying parameters for certificate generation.
- **generate-root-ca.sh**: Script to automate the generation of the root CA certificate and private key.
- **README.md**: This documentation file.

## Generating the Root CA

1. **Configure OpenSSL**: Review and modify the `openssl.cnf` file if necessary to suit your organization's requirements.

2. **Run the Generation Script**: Execute the following command to generate the root CA certificate and private key:

   ```bash
   ./generate-root-ca.sh
   ```

3. **Verify the Root CA**: After running the script, verify that the root CA certificate has been created successfully.

## Using the Root CA

The Root CA can be used to sign intermediate CAs and user certificates. Follow the respective documentation for generating intermediate CAs and user certificates for different roles (admin, QA developer, external developer).

## Important Notes

- Ensure to keep the private key secure and backed up.
- Regularly review the CA's configuration and certificates to maintain security and compliance.

For further assistance, refer to the other README files in the `intermediate-ca` and `user-certs` directories.