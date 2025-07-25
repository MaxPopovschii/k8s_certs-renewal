# QA Developer User Certificate Management

This document provides instructions on how to generate and use a user certificate for the QA developer role, which has a validity of **15 years**.

## Generating the QA Developer Certificate

To generate a QA developer certificate, you will need to run the provided script. This script will create a certificate that is valid for 15 years.

### Prerequisites

- Ensure that the root CA and intermediate CA are set up and configured correctly.
- Make sure you have the necessary permissions to execute the script.

### Steps

1. Open a terminal and navigate to the QA developer user certificate directory:

   ```bash
   cd /path/to/ca-management-project/ca/user-certs/qa-developer
   ```

2. Run the certificate generation script:

   ```bash
   ./generate-qa-cert.sh
   ```

3. Follow any prompts that may appear during the execution of the script.

### Certificate Location

Once the script has completed successfully, the generated QA developer certificate and its corresponding private key will be located in the `qa-developer` directory.

### Usage

The generated QA developer certificate can be used for authentication and secure communication within the specified environments. Ensure that the certificate is kept secure and is only shared with authorized personnel.

## Conclusion

You have successfully generated a QA developer user certificate with a validity of 15 years. For any issues or further assistance, please refer to the project documentation or contact the CA management team.