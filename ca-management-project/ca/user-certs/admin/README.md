# Admin User Certificate Management

This document provides instructions on how to generate and use the admin user certificate within the CA management project.

## Generating the Admin User Certificate

To generate the admin user certificate, run the following script:

```bash
./generate-admin-cert.sh
```

This script will create a user certificate for the admin with a validity of **15 years**.

## Usage of the Admin User Certificate

Once the certificate is generated, it can be used for authentication and secure communication within the specified environments. Ensure that the certificate is stored securely and is accessible only to authorized personnel.

## Additional Information

For further details on the CA management project and other user certificates, please refer to the respective README files in the `user-certs` directory.